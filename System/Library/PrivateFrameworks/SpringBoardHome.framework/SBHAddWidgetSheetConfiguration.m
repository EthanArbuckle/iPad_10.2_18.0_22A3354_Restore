@implementation SBHAddWidgetSheetConfiguration

- (SBIconListLayoutProvider)listLayoutProvider
{
  return (SBIconListLayoutProvider *)(id)swift_unknownObjectRetain();
}

- (void)setListLayoutProvider:(id)a3
{
  sub_1D0158428((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SBHAddWidgetSheetConfiguration_listLayoutProvider);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)(id)swift_unknownObjectRetain();
}

- (void)setIconViewProvider:(id)a3
{
  sub_1D0158428((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SBHAddWidgetSheetConfiguration_iconViewProvider);
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return (SBHIconGridSizeClassDomain *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain));
}

- (void)setGridSizeClassDomain:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain) = (Class)a3;
  v3 = a3;

}

- (NSString)gridSizeClassForContentWidth
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth));
}

- (void)setGridSizeClassForContentWidth:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth) = (Class)a3;
  v3 = a3;

}

- (unint64_t)style
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style);
}

- (void)setStyle:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style) = (Class)a3;
}

- (int64_t)backgroundMaterial
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial);
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial) = (Class)a3;
}

- (NSString)searchPlaceholderText
{
  void *v2;

  if (*(_QWORD *)&self->listLayoutProvider[OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D015F024();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setSearchPlaceholderText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1D015F030();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (UIColor)searchTintColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor));
}

- (void)setSearchTintColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor) = (Class)a3;
  v3 = a3;

}

- (BOOL)applicationCellIncludesGalleryListView
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView);
}

- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView) = a3;
}

- (BOOL)contentContainsInteractiveUIControls
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls);
}

- (void)setContentContainsInteractiveUIControls:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls) = a3;
}

- (BOOL)wantsCustomApplicationsSection
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection);
}

- (void)setWantsCustomApplicationsSection:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection) = a3;
}

- (id)copyWithZone:(void *)a3
{
  SBHAddWidgetSheetConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1D015866C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1D015F0CC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (SBHAddWidgetSheetConfiguration)init
{
  return (SBHAddWidgetSheetConfiguration *)SBHAddWidgetSheetConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
