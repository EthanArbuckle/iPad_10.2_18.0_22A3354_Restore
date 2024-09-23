@implementation PFSharingRemakerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  PFSharingRemakerOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(PFSharingRemakerOptions);
  -[PFSharingRemakerOptions setShouldStripLocation:](v4, "setShouldStripLocation:", -[PFSharingRemakerOptions shouldStripLocation](self, "shouldStripLocation"));
  -[PFSharingRemakerOptions setShouldStripCaption:](v4, "setShouldStripCaption:", -[PFSharingRemakerOptions shouldStripCaption](self, "shouldStripCaption"));
  -[PFSharingRemakerOptions setShouldStripAccessibilityDescription:](v4, "setShouldStripAccessibilityDescription:", -[PFSharingRemakerOptions shouldStripAccessibilityDescription](self, "shouldStripAccessibilityDescription"));
  -[PFSharingRemakerOptions setShouldStripAllMetadata:](v4, "setShouldStripAllMetadata:", -[PFSharingRemakerOptions shouldStripAllMetadata](self, "shouldStripAllMetadata"));
  -[PFSharingRemakerOptions setShouldConvertToSRGB:](v4, "setShouldConvertToSRGB:", -[PFSharingRemakerOptions shouldConvertToSRGB](self, "shouldConvertToSRGB"));
  -[PFSharingRemakerOptions customLocation](self, "customLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setCustomLocation:](v4, "setCustomLocation:", v5);

  -[PFSharingRemakerOptions customDate](self, "customDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setCustomDate:](v4, "setCustomDate:", v6);

  -[PFSharingRemakerOptions customCaption](self, "customCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setCustomCaption:](v4, "setCustomCaption:", v7);

  -[PFSharingRemakerOptions customAccessibilityLabel](self, "customAccessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setCustomAccessibilityLabel:](v4, "setCustomAccessibilityLabel:", v8);

  -[PFSharingRemakerOptions outputDirectoryURL](self, "outputDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setOutputDirectoryURL:](v4, "setOutputDirectoryURL:", v9);

  -[PFSharingRemakerOptions outputFilename](self, "outputFilename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setOutputFilename:](v4, "setOutputFilename:", v10);

  -[PFSharingRemakerOptions exportPreset](self, "exportPreset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setExportPreset:](v4, "setExportPreset:", v11);

  -[PFSharingRemakerOptions exportFileType](self, "exportFileType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFSharingRemakerOptions setExportFileType:](v4, "setExportFileType:", v12);

  return v4;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (BOOL)shouldStripAllMetadata
{
  return self->_shouldStripAllMetadata;
}

- (void)setShouldStripAllMetadata:(BOOL)a3
{
  self->_shouldStripAllMetadata = a3;
}

- (BOOL)shouldConvertToSRGB
{
  return self->_shouldConvertToSRGB;
}

- (void)setShouldConvertToSRGB:(BOOL)a3
{
  self->_shouldConvertToSRGB = a3;
}

- (CLLocation)customLocation
{
  return self->_customLocation;
}

- (void)setCustomLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (void)setCustomDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  self->_shouldStripCaption = a3;
}

- (NSString)customCaption
{
  return self->_customCaption;
}

- (void)setCustomCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  self->_shouldStripAccessibilityDescription = a3;
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (void)setOutputDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void)setOutputFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)exportPreset
{
  return self->_exportPreset;
}

- (void)setExportPreset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)exportFileType
{
  return self->_exportFileType;
}

- (void)setExportFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportFileType, 0);
  objc_storeStrong((id *)&self->_exportPreset, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);
  objc_storeStrong((id *)&self->_customLocation, 0);
}

@end
