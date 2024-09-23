@implementation WebAVMediaSelectionOption

- (WebAVMediaSelectionOption)initWithMediaType:(id)a3 displayName:(id)a4
{
  WebAVMediaSelectionOption *v6;
  WebAVMediaSelectionOption *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebAVMediaSelectionOption;
  v6 = -[WebAVMediaSelectionOption init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mediaType = (NSString *)a3;
    if (a4)
      CFRetain(a4);
    m_ptr = v7->_localizedDisplayName.m_ptr;
    v7->_localizedDisplayName.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const void *v5;
  WebAVMediaSelectionOption *v6;

  v5 = (const void *)objc_msgSend(self->_localizedDisplayName.m_ptr, "copyWithZone:");
  v6 = -[WebAVMediaSelectionOption initWithMediaType:displayName:](+[WebAVMediaSelectionOption allocWithZone:](WebAVMediaSelectionOption, "allocWithZone:", a3), "initWithMediaType:displayName:", self->_mediaType, v5);
  if (v5)
    CFRelease(v5);
  return v6;
}

- (NSString)localizedDisplayName
{
  return (NSString *)self->_localizedDisplayName.m_ptr;
}

- (id)mediaSubTypes
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)hasMediaCharacteristic:(id)a3
{
  WTFLogAlways();
  return 0;
}

- (BOOL)isPlayable
{
  WTFLogAlways();
  return 1;
}

- (id)extendedLanguageTag
{
  WTFLogAlways();
  return 0;
}

- (id)locale
{
  WTFLogAlways();
  return 0;
}

- (id)commonMetadata
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)availableMetadataFormats
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)metadataForFormat:(id)a3
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3
{
  WTFLogAlways();
  return 0;
}

- (id)propertyList
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)displayNameWithLocale:(id)a3
{
  WTFLogAlways();
  return 0;
}

- (id)mediaCharacteristics
{
  WTFLogAlways();
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)outOfBandSource
{
  WTFLogAlways();
  return 0;
}

- (id)outOfBandIdentifier
{
  WTFLogAlways();
  return 0;
}

- (BOOL)_isDesignatedDefault
{
  WTFLogAlways();
  return 0;
}

- (id)languageCode
{
  WTFLogAlways();
  return 0;
}

- (id)track
{
  WTFLogAlways();
  return 0;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_localizedDisplayName.m_ptr;
  self->_localizedDisplayName.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
