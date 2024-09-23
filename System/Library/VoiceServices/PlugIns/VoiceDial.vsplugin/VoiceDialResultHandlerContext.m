@implementation VoiceDialResultHandlerContext

- (VoiceDialResultHandlerContext)init
{
  VoiceDialResultHandlerContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceDialResultHandlerContext;
  result = -[VoiceDialResultHandlerContext init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allNamesMatchedType = 257;
    *(_OWORD *)&result->_resultStatus = xmmword_21DBEEA10;
  }
  return result;
}

- (void)dealloc
{
  void *resultPerson;
  __CFString *contactInfo;
  objc_super v5;

  resultPerson = self->_resultPerson;
  if (resultPerson)
    CFRelease(resultPerson);
  contactInfo = self->_contactInfo;
  if (contactInfo)
    CFRelease(contactInfo);
  v5.receiver = self;
  v5.super_class = (Class)VoiceDialResultHandlerContext;
  -[VoiceDialResultHandlerContext dealloc](&v5, sel_dealloc);
}

- (void)resultPerson
{
  return self->_resultPerson;
}

- (void)setResultPerson:(void *)a3
{
  self->_resultPerson = a3;
}

- (__CFString)contactInfo
{
  return self->_contactInfo;
}

- (void)setContactInfo:(__CFString *)a3
{
  self->_contactInfo = a3;
}

- (NSString)nameToMatch
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNameToMatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)compositeNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompositeNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableSet)spokenCompositeNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpokenCompositeNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)topLevelNonNickNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTopLevelNonNickNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableSet)localizedPhoneLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocalizedPhoneLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableSet)localizedEmailLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLocalizedEmailLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableSet)unlocalizedPhoneLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUnlocalizedPhoneLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableSet)unlocalizedEmailLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUnlocalizedEmailLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)lastNamesByFirstNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastNamesByFirstNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)firstNamesByLastNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFirstNamesByLastNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)phoneticNamesByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPhoneticNamesByName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (int64_t)nicknameMatchCount
{
  return self->_nicknameMatchCount;
}

- (void)setNicknameMatchCount:(int64_t)a3
{
  self->_nicknameMatchCount = a3;
}

- (int)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int)a3
{
  self->_resultStatus = a3;
}

- (int)requiredNameMatchType
{
  return self->_requiredNameMatchType;
}

- (void)setRequiredNameMatchType:(int)a3
{
  self->_requiredNameMatchType = a3;
}

- (int)lastNameMatchType
{
  return self->_lastNameMatchType;
}

- (void)setLastNameMatchType:(int)a3
{
  self->_lastNameMatchType = a3;
}

- (BOOL)allNamesMatchedType
{
  return self->_allNamesMatchedType;
}

- (void)setAllNamesMatchedType:(BOOL)a3
{
  self->_allNamesMatchedType = a3;
}

- (int)matchedLabelType
{
  return self->_matchedLabelType;
}

- (void)setMatchedLabelType:(int)a3
{
  self->_matchedLabelType = a3;
}

- (BOOL)allowFirstFT
{
  return self->_allowFirstFT;
}

- (void)setAllowFirstFT:(BOOL)a3
{
  self->_allowFirstFT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticNamesByName, 0);
  objc_storeStrong((id *)&self->_firstNamesByLastNames, 0);
  objc_storeStrong((id *)&self->_lastNamesByFirstNames, 0);
  objc_storeStrong((id *)&self->_unlocalizedEmailLabels, 0);
  objc_storeStrong((id *)&self->_unlocalizedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_localizedEmailLabels, 0);
  objc_storeStrong((id *)&self->_localizedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_topLevelNonNickNames, 0);
  objc_storeStrong((id *)&self->_spokenCompositeNames, 0);
  objc_storeStrong((id *)&self->_compositeNames, 0);
  objc_storeStrong((id *)&self->_nameToMatch, 0);
}

@end
