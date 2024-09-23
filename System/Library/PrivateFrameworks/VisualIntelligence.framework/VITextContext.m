@implementation VITextContext

- (VITextContext)initWithSurroundingText:(id)a3 normalizedBoundingBoxes:(id)a4
{
  id v6;
  id v7;
  VITextContext *v8;
  uint64_t v9;
  NSString *surroundingText;
  uint64_t v11;
  NSArray *normalizedBoundingBoxes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VITextContext;
  v8 = -[VITextContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    surroundingText = v8->_surroundingText;
    v8->_surroundingText = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    normalizedBoundingBoxes = v8->_normalizedBoundingBoxes;
    v8->_normalizedBoundingBoxes = (NSArray *)v11;

  }
  return v8;
}

- (NSString)surroundingText
{
  return self->_surroundingText;
}

- (NSArray)normalizedBoundingBoxes
{
  return self->_normalizedBoundingBoxes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_surroundingText, 0);
}

@end
