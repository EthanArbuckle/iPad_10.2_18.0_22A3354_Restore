@implementation FontSizePicker.Coordinator

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  void (*v7)(int64_t);
  id v8;
  _TtCV8PaperKit14FontSizePicker11Coordinator *v9;

  type metadata accessor for FontSizeViewController();
  if (swift_dynamicCastClass())
  {
    v7 = *(void (**)(int64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtCV8PaperKit14FontSizePicker11Coordinator_pickedSize);
    v8 = a3;
    v9 = self;
    v7(a4);

  }
}

- (void).cxx_destruct
{
  @objc FontPicker.Coordinator.__ivar_destroyer((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCV8PaperKit14FontSizePicker11Coordinator_parent, type metadata accessor for FontSizePicker);
}

@end
