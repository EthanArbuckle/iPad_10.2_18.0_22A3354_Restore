@implementation PXPhotosLayout.AssociatedData

- (_TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData)init
{
  _OWORD *v2;
  __int128 v3;
  objc_super v5;

  v2 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets);
  v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v2 = *MEMORY[0x1E0DC49E8];
  v2[1] = v3;
  v5.receiver = self;
  v5.super_class = (Class)_s14AssociatedDataCMa_8();
  return -[PXPhotosLayout.AssociatedData init](&v5, sel_init);
}

@end
