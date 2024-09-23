@implementation WFiTunesSoftwareObject

- (NSString)artistID
{
  return self->_artistID;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSNumber)price
{
  return self->_price;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSArray)screenshotURLs
{
  return self->_screenshotURLs;
}

- (NSArray)iPadScreenshotURLs
{
  return self->_iPadScreenshotURLs;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isUniversal
{
  return self->_isUniversal;
}

- (BOOL)supportsGameCenter
{
  return self->_supportsGameCenter;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)releaseNotes
{
  return self->_releaseNotes;
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (NSNumber)averageRating
{
  return self->_averageRating;
}

- (NSNumber)numberOfRatings
{
  return self->_numberOfRatings;
}

- (NSNumber)averageRatingLatestVersion
{
  return self->_averageRatingLatestVersion;
}

- (NSNumber)numberOfRatingsLatestVersion
{
  return self->_numberOfRatingsLatestVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRatingsLatestVersion, 0);
  objc_storeStrong((id *)&self->_averageRatingLatestVersion, 0);
  objc_storeStrong((id *)&self->_numberOfRatings, 0);
  objc_storeStrong((id *)&self->_averageRating, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_iPadScreenshotURLs, 0);
  objc_storeStrong((id *)&self->_screenshotURLs, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WFiTunesSoftwareObject;
  objc_msgSendSuper2(&v9, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("screenshotURLs"));

  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("iPadScreenshotURLs"));

  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("supportedLanguages"));

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportedDevices"));

  return v3;
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[30];
  _QWORD v8[31];

  v8[30] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesSoftwareObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("name");
  v8[0] = CFSTR("trackId");
  v8[1] = CFSTR("trackName");
  v7[2] = CFSTR("censoredName");
  v7[3] = CFSTR("kind");
  v8[2] = CFSTR("trackCensoredName");
  v8[3] = CFSTR("kind");
  v7[4] = CFSTR("viewURL");
  v7[5] = CFSTR("bundleIdentifier");
  v8[4] = CFSTR("trackViewUrl");
  v8[5] = CFSTR("bundleId");
  v7[6] = CFSTR("lastUpdated");
  v7[7] = CFSTR("category");
  v8[6] = CFSTR("currentVersionReleaseDate");
  v8[7] = CFSTR("primaryGenreName");
  v7[8] = CFSTR("version");
  v7[9] = CFSTR("price");
  v8[8] = CFSTR("version");
  v8[9] = CFSTR("price");
  v7[10] = CFSTR("currencyCode");
  v7[11] = CFSTR("artistID");
  v8[10] = CFSTR("currency");
  v8[11] = CFSTR("artistId");
  v7[12] = CFSTR("artistName");
  v7[13] = CFSTR("releaseDate");
  v8[12] = CFSTR("artistName");
  v8[13] = CFSTR("releaseDate");
  v7[14] = CFSTR("formattedPrice");
  v7[15] = CFSTR("descriptionText");
  v8[14] = CFSTR("formattedPrice");
  v8[15] = CFSTR("description");
  v7[16] = CFSTR("releaseNotes");
  v7[17] = CFSTR("contentRating");
  v8[16] = CFSTR("releaseNotes");
  v8[17] = CFSTR("trackContentRating");
  v7[18] = CFSTR("minimumOSVersion");
  v7[19] = CFSTR("fileSize");
  v8[18] = CFSTR("minimumOsVersion");
  v8[19] = CFSTR("fileSizeBytes");
  v7[20] = CFSTR("averageRating");
  v7[21] = CFSTR("numberOfRatings");
  v8[20] = CFSTR("averageUserRating");
  v8[21] = CFSTR("userRatingCount");
  v7[22] = CFSTR("averageRatingLatestVersion");
  v7[23] = CFSTR("numberOfRatingsLatestVersion");
  v8[22] = CFSTR("averageUserRatingForCurrentVersion");
  v8[23] = CFSTR("userRatingCountForCurrentVersion");
  v7[24] = CFSTR("isUniversal");
  v7[25] = CFSTR("supportsGameCenter");
  v8[24] = CFSTR("features");
  v8[25] = CFSTR("features");
  v7[26] = CFSTR("supportedLanguages");
  v7[27] = CFSTR("supportedDevices");
  v8[26] = CFSTR("languageCodesISO2A");
  v8[27] = CFSTR("supportedDevices");
  v7[28] = CFSTR("screenshotURLs");
  v7[29] = CFSTR("iPadScreenshotURLs");
  v8[28] = CFSTR("screenshotUrls");
  v8[29] = CFSTR("ipadScreenshotUrls");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

+ (id)isUniversalJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", &__block_literal_global_532);
}

+ (id)supportsGameCenterJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", &__block_literal_global_535);
}

+ (id)screenshotURLsJSONTransformer
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_URLValueTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSValueTransformer mtl_arrayMappingTransformerWithTransformer:](MTLValueTransformer, "mtl_arrayMappingTransformerWithTransformer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)iPadScreenshotURLsJSONTransformer
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_URLValueTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSValueTransformer mtl_arrayMappingTransformerWithTransformer:](MTLValueTransformer, "mtl_arrayMappingTransformerWithTransformer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fileSizeJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_numberTransformerWithNumberStyle:locale:", 0, 0);
}

uint64_t __59__WFiTunesSoftwareObject_supportsGameCenterJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "containsObject:", CFSTR("gameCenter")));
}

uint64_t __52__WFiTunesSoftwareObject_isUniversalJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "containsObject:", CFSTR("iosUniversal")));
}

@end
