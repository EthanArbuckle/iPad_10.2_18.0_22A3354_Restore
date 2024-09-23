@implementation CNVCardPerson

- (id)largeImageHashOfType:(id)a3
{
  return 0;
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNickname:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)maidenName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMaidenName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)phoneticFirstName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPhoneticFirstName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)phoneticMiddleName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPhoneticMiddleName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)phoneticLastName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPhoneticLastName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)pronunciationFirstName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPronunciationFirstName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)pronunciationLastName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPronunciationLastName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)addressingGrammars
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAddressingGrammars:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOrganization:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)phoneticOrganization
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPhoneticOrganization:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)department
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDepartment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)jobTitle
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setJobTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isCompany
{
  return self->_isCompany;
}

- (void)setIsCompany:(BOOL)a3
{
  self->_isCompany = a3;
}

- (int)nameOrder
{
  return self->_nameOrder;
}

- (void)setNameOrder:(int)a3
{
  self->_nameOrder = a3;
}

- (NSArray)emailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)phoneNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPhoneNumbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)postalAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPostalAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)socialProfiles
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSocialProfiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)instantMessagingAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInstantMessagingAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUrls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)calendarURIs
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCalendarURIs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSDictionary)activityAlerts
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setActivityAlerts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSArray)imageReferences
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setImageReferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSDictionary)imageCropRects
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setImageCropRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSDictionary)largeImageCropRects
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLargeImageCropRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSData)largeImageData
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLargeImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)imageType
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setImageType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSData)imageHash
{
  return (NSData *)objc_getProperty(self, a2, 264, 1);
}

- (void)setImageHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSData)memojiMetadata
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMemojiMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSData)wallpaper
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setWallpaper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSData)watchWallpaperImageData
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setWatchWallpaperImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (int)sharedPhotoDisplayPreference
{
  return self->_sharedPhotoDisplayPreference;
}

- (void)setSharedPhotoDisplayPreference:(int)a3
{
  self->_sharedPhotoDisplayPreference = a3;
}

- (NSData)imageBackgroundColorsData
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setImageBackgroundColorsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSData)sensitiveContentConfiguration
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSensitiveContentConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSDateComponents)birthdayComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBirthdayComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSDateComponents)alternateBirthdayComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 320, 1);
}

- (void)setAlternateBirthdayComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSArray)otherDateComponents
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setOtherDateComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSArray)relatedNames
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRelatedNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)note
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setNote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSArray)namesOfParentGroups
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)setNamesOfParentGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSString)cardDAVUID
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCardDAVUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setUid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSString)phonemeData
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setPhonemeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)preferredLikenessSource
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setPreferredLikenessSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSString)preferredApplePersonaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setPreferredApplePersonaIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSArray)unknownProperties
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)setUnknownProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (int)downtimeWhitelistAuthorization
{
  return self->_downtimeWhitelistAuthorization;
}

- (void)setDowntimeWhitelistAuthorization:(int)a3
{
  self->_downtimeWhitelistAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredApplePersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLikenessSource, 0);
  objc_storeStrong((id *)&self->_unknownProperties, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_cardDAVUID, 0);
  objc_storeStrong((id *)&self->_namesOfParentGroups, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_otherDateComponents, 0);
  objc_storeStrong((id *)&self->_alternateBirthdayComponents, 0);
  objc_storeStrong((id *)&self->_birthdayComponents, 0);
  objc_storeStrong((id *)&self->_sensitiveContentConfiguration, 0);
  objc_storeStrong((id *)&self->_imageBackgroundColorsData, 0);
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_largeImageData, 0);
  objc_storeStrong((id *)&self->_largeImageCropRects, 0);
  objc_storeStrong((id *)&self->_imageCropRects, 0);
  objc_storeStrong((id *)&self->_imageReferences, 0);
  objc_storeStrong((id *)&self->_activityAlerts, 0);
  objc_storeStrong((id *)&self->_calendarURIs, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_instantMessagingAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_department, 0);
  objc_storeStrong((id *)&self->_phoneticOrganization, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_addressingGrammars, 0);
  objc_storeStrong((id *)&self->_pronunciationLastName, 0);
  objc_storeStrong((id *)&self->_pronunciationFirstName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_maidenName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
