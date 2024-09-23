@implementation ContactPickerView.Coordinator

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  _TtCV14WorkflowEditor17ContactPickerView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_226821030();

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  _TtCV14WorkflowEditor17ContactPickerView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_226821200((uint64_t)v8, v7);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;
  _TtCV14WorkflowEditor17ContactPickerView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_226821310((uint64_t)v8, v7);

}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  _TtCV14WorkflowEditor17ContactPickerView11Coordinator *v7;

  v6 = a3;
  v7 = self;
  sub_22682139C(v6, a4);

}

- (_TtCV14WorkflowEditor17ContactPickerView11Coordinator)init
{
  sub_2266B8448();
}

- (void).cxx_destruct
{
  sub_2268225AC((uint64_t)self + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent);
}

@end
