@implementation ShapeView

- (BOOL)becomeFirstResponder
{
  _TtC8PaperKit9ShapeView *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = ShapeView.becomeFirstResponder()();

  return v3;
}

- (BOOL)resignFirstResponder
{
  _TtC8PaperKit9ShapeView *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = ShapeView.resignFirstResponder()();

  return v3;
}

- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[ShapeView frame](self, sel_frame, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)textBoxViewUpdateViewFrame:(id)a3 viewFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  _TtC8PaperKit9ShapeView *v17;
  uint64_t v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<Shape>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)self) + 0x380);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v15, v10);
  v16 = a3;
  v17 = self;
  LOBYTE(self) = specialized Capsule<>.isTextBox.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if ((self & 1) != 0)
    -[ShapeView setFrame:](v17, sel_setFrame_, x, y, width, height);

}

- (void)textBoxViewUpdateModelFrame:(id)a3 modelFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  _TtC8PaperKit9ShapeView *v17;
  uint64_t v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<Shape>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)self) + 0x380);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v15, v10);
  v16 = a3;
  v17 = self;
  LOBYTE(self) = specialized Capsule<>.isTextBox.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if ((self & 1) != 0)
    specialized CanvasElementView.modelFrame.setter(x, y, width, height);

}

@end
