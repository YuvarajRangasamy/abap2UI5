CLASS z2ui5_cl_app_demo_01 DEFINITION PUBLIC.

  PUBLIC SECTION.

    INTERFACES z2ui5_if_app.

    DATA product TYPE string.
    DATA quantity TYPE string.

    DATA check_initialized TYPE abap_bool.

ENDCLASS.

CLASS z2ui5_cl_app_demo_01 IMPLEMENTATION.

  METHOD z2ui5_if_app~on_event.

    "set initial values
    IF check_initialized = abap_false.
      check_initialized = abap_true.
      product = 'tomato'.
      quantity = '500'.
    ENDIF.

    "user event handling
    CASE client->event( )->get_id( ).

      WHEN 'BTN_POST'.
        "do something
        "...
        "..
        ".
        client->popup( )->display_message_toast( |Product { product } Quantity { quantity } GR successful| ).

    ENDCASE.

  ENDMETHOD.

  METHOD z2ui5_if_app~set_view.

    view->factory_selscreen( title = 'My ABAP Application'
        )->begin_of_block( 'Selection Screen'
            )->begin_of_group( 'Stock Information'

                )->label( 'Product'
                )->input( product

                )->label( 'Quantity'
                )->input( quantity

                )->button( text = 'Post Goods Receipt' on_press_id = 'BTN_POST'
   ).

  ENDMETHOD.

ENDCLASS.