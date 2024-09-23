@implementation PXPhotosViewRoundedAccessoryButton

- (CGPoint)menuOffset
{
  double *v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setMenuOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat *v5;

  y = a3.y;
  x = a3.x;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  swift_beginAccess();
  *v5 = x;
  v5[1] = y;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  double v7;
  double v8;
  double (*v9)(id);
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGPoint result;

  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for PhotosViewRoundedAccessoryButton();
  v4 = a3;
  v5 = v18.receiver;
  v6 = -[PXPhotosViewRoundedAccessoryButton menuAttachmentPointForConfiguration:](&v18, sel_menuAttachmentPointForConfiguration_, v4);
  v8 = v7;
  v9 = *(double (**)(id))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x78);
  v11 = v10 + v9(v6);
  ((void (*)(uint64_t, uint64_t))v9)(v12, v13);
  v15 = v14;

  v16 = v8 + v15;
  v17 = v11;
  result.y = v16;
  result.x = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  PXPhotosViewRoundedAccessoryButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1A6B2ACF8(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  PXPhotosViewRoundedAccessoryButton *v2;

  v2 = self;
  sub_1A6B2B0D4();

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_1A6B2B260(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (const char **)&selRef_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, (SEL *)&selRef_willOpen);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_1A6B2B260(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (const char **)&selRef_contextMenuInteraction_willEndForConfiguration_animator_, (SEL *)&selRef_didClose);
}

- (PXPhotosViewRoundedAccessoryButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  _QWORD *v9;
  objc_class *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_symbolName);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  v10 = (objc_class *)type metadata accessor for PhotosViewRoundedAccessoryButton();
  *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[PXPhotosViewRoundedAccessoryButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (PXPhotosViewRoundedAccessoryButton)initWithCoder:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_symbolName);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  v7 = (objc_class *)type metadata accessor for PhotosViewRoundedAccessoryButton();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[PXPhotosViewRoundedAccessoryButton initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
