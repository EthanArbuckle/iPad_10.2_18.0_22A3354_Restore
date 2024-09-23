@implementation VIStreamingDetectedObject

- (VIStreamingDetectedObject)initWithObjectUUID:(id)a3 normalizedBoundingBox:(CGRect)a4 domainKey:(id)a5 glyphName:(id)a6 displayLabel:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  id v18;
  VIStreamingDetectedObject *v19;
  uint64_t v20;
  NSUUID *objectUUID;
  uint64_t v22;
  NSString *domainKey;
  uint64_t v24;
  NSString *glyphName;
  uint64_t v26;
  NSString *displayLabel;
  objc_super v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)VIStreamingDetectedObject;
  v19 = -[VIStreamingDetectedObject init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    objectUUID = v19->_objectUUID;
    v19->_objectUUID = (NSUUID *)v20;

    v19->_normalizedBoundingBox.origin.x = x;
    v19->_normalizedBoundingBox.origin.y = y;
    v19->_normalizedBoundingBox.size.width = width;
    v19->_normalizedBoundingBox.size.height = height;
    v22 = objc_msgSend(v16, "copy");
    domainKey = v19->_domainKey;
    v19->_domainKey = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    glyphName = v19->_glyphName;
    v19->_glyphName = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    displayLabel = v19->_displayLabel;
    v19->_displayLabel = (NSString *)v26;

  }
  return v19;
}

- (NSUUID)objectUUID
{
  return self->_objectUUID;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)domainKey
{
  return self->_domainKey;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_domainKey, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
}

@end
