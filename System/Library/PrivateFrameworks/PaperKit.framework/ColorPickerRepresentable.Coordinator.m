@implementation ColorPickerRepresentable.Coordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  void (*v7)(id);
  id v8;
  id v9;
  _TtCV8PaperKit24ColorPickerRepresentable11Coordinator *v10;

  v7 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_pickedColor);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v7(v9);

}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtCV8PaperKit24ColorPickerRepresentable11Coordinator *v16;
  uint64_t v17;

  v5 = type metadata accessor for PresentationMode();
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<PresentationMode>);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ColorPickerRepresentable(0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of PKStrokeProperties((uint64_t)self + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_parent, (uint64_t)v14, type metadata accessor for ColorPickerRepresentable);
  v15 = a3;
  v16 = self;
  specialized Environment.wrappedValue.getter((uint64_t)v10);
  outlined destroy of PKStrokeProperties((uint64_t)v14, type metadata accessor for ColorPickerRepresentable);
  MEMORY[0x1DF0E24B4](v7);
  PresentationMode.dismiss()();
  Binding.wrappedValue.setter();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v10, &demangling cache variable for type metadata for Binding<PresentationMode>);

}

- (void).cxx_destruct
{
  outlined destroy of PKStrokeProperties((uint64_t)self + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_parent, type metadata accessor for ColorPickerRepresentable);
  swift_release();
}

@end
