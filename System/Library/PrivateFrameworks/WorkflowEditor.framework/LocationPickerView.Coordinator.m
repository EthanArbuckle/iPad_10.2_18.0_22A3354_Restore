@implementation LocationPickerView.Coordinator

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  id v6;
  id v7;
  _TtCV14WorkflowEditor18LocationPickerView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266B80CC((uint64_t)v8, a4);

}

- (void)locationPickerDidCancel:(id)a3
{
  id v4;
  _TtCV14WorkflowEditor18LocationPickerView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2266B82FC();

}

- (_TtCV14WorkflowEditor18LocationPickerView11Coordinator)init
{
  sub_2266B8448();
}

- (void).cxx_destruct
{
  sub_2266BA550((uint64_t)self + OBJC_IVAR____TtCV14WorkflowEditor18LocationPickerView11Coordinator_parent);
}

@end
