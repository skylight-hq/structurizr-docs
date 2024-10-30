workspace {

    # README: https://docs.structurizr.com/dsl/identifiers#identifier-scope
    # Used to force references to include the full path for relationship
    # identifiers.
    !identifiers hierarchical

    !adrs "./decisions"

    model {
        properties {
            # README: https://docs.structurizr.com/dsl/cookbook/groups/#nested-groups
            "structurizr.groupSeparator" "/"
        }

        !include "./models/default.dsl"

        # README: This software system exists only to give the Documentation section of
        # Structurizr a title for the scope of this documentation. More
        # infromation about why this is necessary can be found here:
        # https://docs.structurizr.com/ui/documentation/headings
        softwareSystem "Guides" {
            !docs "./guides"
        }

        # README: This software system exists only to give the Documentation section of
        # Structurizr a title for the scope of this documentation. More
        # infromation about why this is necessary can be found here:
        # https://docs.structurizr.com/ui/documentation/headings
        softwareSystem "Run books" {
            !docs "./runbooks"
        }
    }

    views {
        !include "./views/default.dsl"

        # MARK: :styles
        #  _______ __          __
        # |     __|  |_.--.--.|  |.-----.-----.
        # |__     |   _|  |  ||  ||  -__|__ --|
        # |_______|____|___  ||__||_____|_____|
        #              |_____|
        !include "./styles/default.dsl"


        # MARK: :branding
        #  ______                      __ __
        # |   __ \.----.---.-.-----.--|  |__|.-----.-----.
        # |   __ <|   _|  _  |     |  _  |  ||     |  _  |
        # |______/|__| |___._|__|__|_____|__||__|__|___  |
        #                                          |_____|
        !include "./styles/branding.dsl"

        # MARK: :view_properties
        properties {
            # README: https://docs.structurizr.com/ui/properties
            "structurizr.locale" "en-US"
            "structurizr.timezone" "America/New_York"
        }
    }

    configuration {
        scope none
    }
}
