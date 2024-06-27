!const bg_fhir "#fafac6"
!const fg_auth "#f5bb00"
!const fg_repository "#d5e68d"
!const fg_api "#9cc4b2"
!const fg_dal "#846075"

!const bg_element "#f7f7ff"
!const fg_text "#564154"
!const fg_element_person "#ffca3a"
!const fg_element_software_system "#17bebb"
!const fg_internal_user "#12BFCE"
!const fg_external_user "#02A144"
!const fg_no_access_user "#CD533B"

!const bg_element_data_structure "#8ea604"

!const fg_interface "#3E7CB1"
!const fg_service "#2374ab"
!const fg_module "#D58936"

!const fg_reads "#19647e"
!const fg_audits "#e2c033"
!const fg_converts "#ca9ce1"
!const fg_writes "#28afb0"
!const fg_deletes "#ff3c38"
!const fg_uses "#76b041"
!const fg_redirects "#c3bef7"
!const fg_error "#ff3c38"

styles {

    # MARK: :base:styles
    #  ______
    # |   __ \.---.-.-----.-----.
    # |   __ <|  _  |__ --|  -__|
    # |______/|___._|_____|_____|
    #
    element "Element" {
        background "${bg_element}"
        color "${fg_text}"
        strokeWidth 5
        metadata false
    }

    element "Person" {
        shape "Person"
        stroke "${fg_element_person}"
        icon "./icons/team-users.png"
    }

    element "Software System" {
        shape "Circle"
        stroke "${fg_element_software_system}"
        icon "./icons/software-system.png"
    }

    # MARK: :tags:styles
    #  _______
    # |_     _|.---.-.-----.-----.
    #   |   |  |  _  |  _  |__ --|
    #   |___|  |___._|___  |_____|
    #                |_____|
    element "Internal User" {
        stroke "${fg_internal_user}"
        icon "./icons/internal-user.png"
    }

    element "External User" {
        stroke "${fg_external_user}"
        icon "./icons/external-user.png"
    }

    element "No Access User" {
        stroke "${fg_no_access_user}"
        icon "./icons/no-access-user.png"
    }

    element "Data Structure" {
        shape "RoundedBox"
        background "${bg_element_data_structure}"
        color "${bg_element}"
        stroke "${fg_text}"
    }

    element "Service" {
        shape "Hexagon"
        icon "./icons/service.png"
        color "${fg_service}"
        stroke "${fg_service}"
    }

    element "Module" {
        shape "RoundedBox"
        color "${fg_module}"
        stroke "${fg_module}"
        icon "./icons/module.png"
    }

    element "Group:Auth" {
        color "${fg_auth}"
        icon "./icons/auth.png"
    }

    element "Group:Data Planner Controller (API)" {
        color "${fg_api}"
        icon "./icons/api.png"
    }

    element "Group:Data Planner Service (DAL)" {
        color "${fg_dal}"
        icon "./icons/dal.png"
    }

    element "Group:Data Structures" {
        color "${bg_element_data_structure}"
        icon "./icons/data-structure.png"
    }

    element "Group:FHIR Adapter API" {
        color "${fg_text}"
        icon "./icons/api.png"
    }

    element "API" {
        shape "Ellipse"
        color "${fg_api}"
        stroke "${fg_api}"
        icon "./icons/api.png"
    }
    element "Application" {
        shape "WebBrowser"
        color "${fg_interface}"
        stroke "${fg_interface}"
        icon "./icons/web-application.png"
    }

    element "Database" {
        shape "Cylinder"
        background "${bg_element_data_structure}"
        color "${bg_element}"
    }

    element "Document" {
        icon "./icons/data-document.png"
    }

    element "FHIR" {
        shape "Hexagon"
        icon "./icons/fhir-logo.png"
        background "${bg_fhir}"
    }

    element "Auth" {
        shape "Pipe"
        icon "./icons/auth.png"
        stroke "${fg_auth}"
    }

    element "Repository" {
        shape "Cylinder"
        icon "./icons/github.png"
        stroke "${fg_repository}"
    }

    element "MongoDB" {
        icon "./icons/mongodb.png"
    }

    element "Endpoint" {
        shape "Component"
        stroke "${fg_text}"
    }

    element "GET_METHOD" {
        stroke "${fg_reads}"
        color "${fg_reads}"
    }

    element "POST_METHOD" {
        stroke "${fg_writes}"
        color "${fg_writes}"
    }

    element "Reads" {
        stroke "${fg_reads}"
    }

    element "Writes" {
        stroke "${fg_writes}"
    }

    element "Deletes" {
        stroke "${fg_deletes}"
    }

    element "Audits" {
        stroke "${fg_audits}"
    }

    element "Converts" {
        stroke "${fg_converts}"
    }

    element "Data Access" {
        shape "Folder"
        stroke "${fg_text}"
    }


    # MARK: :relationship:styles
    #  ______         __         __   __                     __     __
    # |   __ \.-----.|  |.---.-.|  |_|__|.-----.-----.-----.|  |--.|__|.-----.
    # |      <|  -__||  ||  _  ||   _|  ||  _  |     |__ --||     ||  ||  _  |
    # |___|__||_____||__||___._||____|__||_____|__|__|_____||__|__||__||   __|
    #                                                                  |__|
    relationship "Relationship" {
        style "solid"
        thickness 3
    }

    relationship "Reads" {
        color "${fg_reads}"
    }

    relationship "Audits" {
        color "${fg_audits}"
    }

    relationship "Converts" {
        color "${fg_converts}"
    }

    relationship "Writes" {
        color "${fg_writes}"
    }

    relationship "Deletes" {
        color "${fg_deletes}"
    }

    relationship "Uses" {
        color "${fg_uses}"
        style "dotted"
    }

    relationship "Redirects" {
        color "${fg_redirects}"
        style "dashed"
    }

    relationship "Success" {
        color "${bg_element_data_structure}"
    }

    relationship "Error" {
        color "${fg_error}"
    }
}
