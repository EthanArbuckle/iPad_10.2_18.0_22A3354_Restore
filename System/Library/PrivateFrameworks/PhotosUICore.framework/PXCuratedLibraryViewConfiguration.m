@implementation PXCuratedLibraryViewConfiguration

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
  PXCuratedLibraryViewConfiguration *v3;
  PHPhotoLibrary *v4;
  void *v5;
  char v7;

  type metadata accessor for LemonadeFeatureAvailabilityMonitor();
  v7 = 6;
  v3 = self;
  v4 = -[PXCuratedLibraryViewConfiguration photoLibrary](v3, sel_photoLibrary);
  v5 = (void *)static LemonadeFeatureAvailabilityMonitor.sharedStatus(feature:for:)(&v7, v4);

  return (PXLemonadeFeatureAvailabilityMonitor *)v5;
}

- (void)swift_copyPropertiesFromConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  PXCuratedLibraryViewConfiguration *v13;
  char *v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  _BYTE v19[24];

  v5 = sub_1A7ADF540();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v11 = &v19[-v10];
  v12 = a3;
  v13 = self;
  v14 = (char *)sub_1A6D77504();
  v15 = &v14[OBJC_IVAR____TtCE12PhotosUICoreCSo33PXCuratedLibraryViewConfigurationP33_75D970158E8B950190794F9BFB2C659F14AssociatedData_environmentValues];
  swift_beginAccess();
  v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, v15, v5);

  v17 = (char *)sub_1A6D77504();
  v16(v8, v11, v5);
  v18 = &v17[OBJC_IVAR____TtCE12PhotosUICoreCSo33PXCuratedLibraryViewConfigurationP33_75D970158E8B950190794F9BFB2C659F14AssociatedData_environmentValues];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 40))(v18, v8, v5);
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

- (void)swift_propagateEnvironmentValuesToExtendedTraitCollection:(id)a3
{
  id v5;
  PXCuratedLibraryViewConfiguration *v6;

  sub_1A68763C4(&qword_1EE8C43E8, &qword_1EE8C43F0, (uint64_t)off_1E50B2120, (uint64_t)&protocol conformance descriptor for PXCuratedLibraryViewConfiguration);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2838);
  sub_1A68763C4(&qword_1EE8C2830, (unint64_t *)&qword_1EE8C2838, (uint64_t)off_1E50B2478, (uint64_t)&protocol conformance descriptor for PXExtendedTraitCollection);
  v5 = a3;
  v6 = self;
  sub_1A7ADF588();

}

- (PXCuratedLibraryViewConfiguration)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXCuratedLibraryViewConfiguration *v6;
  PXCuratedLibraryViewConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryViewConfiguration;
  v6 = -[PXCuratedLibraryViewConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_initialZoomLevel = 0;
    v7->_secondaryToolbarStyle = 0;
    *(_DWORD *)&v7->_enableDays = 16843009;
    v7->_enableSecondaryToolbarContainerView = 0;
    v7->_overrideDefaultNumberOfColumns = 0;
    v7->_allowedInteractiveDismissBehaviors = 0;
  }

  return v7;
}

- (PXCuratedLibraryViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewConfiguration.m"), 34, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryViewConfiguration init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXCuratedLibraryViewConfiguration *v4;
  void *v5;
  PXCuratedLibraryViewConfiguration *v6;
  void *v7;

  v4 = [PXCuratedLibraryViewConfiguration alloc];
  -[PXCuratedLibraryViewConfiguration photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXCuratedLibraryViewConfiguration initWithPhotoLibrary:](v4, "initWithPhotoLibrary:", v5);

  -[PXCuratedLibraryViewConfiguration setInitialZoomLevel:](v6, "setInitialZoomLevel:", -[PXCuratedLibraryViewConfiguration initialZoomLevel](self, "initialZoomLevel"));
  -[PXCuratedLibraryViewConfiguration setEnableDays:](v6, "setEnableDays:", -[PXCuratedLibraryViewConfiguration enableDays](self, "enableDays"));
  -[PXCuratedLibraryViewConfiguration setEnableFooter:](v6, "setEnableFooter:", -[PXCuratedLibraryViewConfiguration enableFooter](self, "enableFooter"));
  -[PXCuratedLibraryViewConfiguration setEnableNavigationHeader:](v6, "setEnableNavigationHeader:", -[PXCuratedLibraryViewConfiguration enableNavigationHeader](self, "enableNavigationHeader"));
  -[PXCuratedLibraryViewConfiguration setIsExpandedInitially:](v6, "setIsExpandedInitially:", -[PXCuratedLibraryViewConfiguration isExpandedInitially](self, "isExpandedInitially"));
  -[PXCuratedLibraryViewConfiguration setAllowedInteractiveDismissBehaviors:](v6, "setAllowedInteractiveDismissBehaviors:", -[PXCuratedLibraryViewConfiguration allowedInteractiveDismissBehaviors](self, "allowedInteractiveDismissBehaviors"));
  -[PXCuratedLibraryViewConfiguration setOverrideDefaultNumberOfColumns:](v6, "setOverrideDefaultNumberOfColumns:", -[PXCuratedLibraryViewConfiguration overrideDefaultNumberOfColumns](self, "overrideDefaultNumberOfColumns"));
  -[PXCuratedLibraryViewConfiguration setSecondaryToolbarStyle:](v6, "setSecondaryToolbarStyle:", -[PXCuratedLibraryViewConfiguration secondaryToolbarStyle](self, "secondaryToolbarStyle"));
  -[PXCuratedLibraryViewConfiguration viewOptionsModel](self, "viewOptionsModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewConfiguration setViewOptionsModel:](v6, "setViewOptionsModel:", v7);

  -[PXCuratedLibraryViewConfiguration setEnableSecondaryToolbarContainerView:](v6, "setEnableSecondaryToolbarContainerView:", -[PXCuratedLibraryViewConfiguration enableSecondaryToolbarContainerView](self, "enableSecondaryToolbarContainerView"));
  -[PXCuratedLibraryViewConfiguration swift_copyPropertiesFromConfiguration:](v6, "swift_copyPropertiesFromConfiguration:", self);
  return v6;
}

- (BOOL)isZoomLevelEnabled:(int64_t)a3
{
  if (!a3)
    return 0;
  if (a3 == 3)
    return -[PXCuratedLibraryViewConfiguration enableDays](self, "enableDays");
  return 1;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)initialZoomLevel
{
  return self->_initialZoomLevel;
}

- (void)setInitialZoomLevel:(int64_t)a3
{
  self->_initialZoomLevel = a3;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (void)setEnableDays:(BOOL)a3
{
  self->_enableDays = a3;
}

- (BOOL)enableFooter
{
  return self->_enableFooter;
}

- (void)setEnableFooter:(BOOL)a3
{
  self->_enableFooter = a3;
}

- (BOOL)enableNavigationHeader
{
  return self->_enableNavigationHeader;
}

- (void)setEnableNavigationHeader:(BOOL)a3
{
  self->_enableNavigationHeader = a3;
}

- (BOOL)isExpandedInitially
{
  return self->_isExpandedInitially;
}

- (void)setIsExpandedInitially:(BOOL)a3
{
  self->_isExpandedInitially = a3;
}

- (unint64_t)secondaryToolbarStyle
{
  return self->_secondaryToolbarStyle;
}

- (void)setSecondaryToolbarStyle:(unint64_t)a3
{
  self->_secondaryToolbarStyle = a3;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3
{
  self->_allowedInteractiveDismissBehaviors = a3;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (void)setViewOptionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewOptionsModel, a3);
}

- (BOOL)enableSecondaryToolbarContainerView
{
  return self->_enableSecondaryToolbarContainerView;
}

- (void)setEnableSecondaryToolbarContainerView:(BOOL)a3
{
  self->_enableSecondaryToolbarContainerView = a3;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
