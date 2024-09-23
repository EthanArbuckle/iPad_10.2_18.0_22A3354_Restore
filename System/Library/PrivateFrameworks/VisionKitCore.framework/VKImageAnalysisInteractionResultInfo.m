@implementation VKImageAnalysisInteractionResultInfo

- (VKImageAnalysisInteractionResultInfo)initWithDisplayLabel:(id)a3 displayMessage:(id)a4 glyphName:(id)a5 rect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  VKImageAnalysisInteractionResultInfo *v17;
  VKImageAnalysisInteractionResultInfo *v18;
  objc_super v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VKImageAnalysisInteractionResultInfo;
  v17 = -[VKImageAnalysisInteractionResultInfo init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v18->_displayLabel, a3);
    objc_storeStrong((id *)&v18->_displayMessage, a4);
    objc_storeStrong((id *)&v18->_glyphName, a5);
    v18->_normalizedBoundingRect.origin.x = x;
    v18->_normalizedBoundingRect.origin.y = y;
    v18->_normalizedBoundingRect.size.width = width;
    v18->_normalizedBoundingRect.size.height = height;
  }

  return v18;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (CGRect)normalizedBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingRect.origin.x;
  y = self->_normalizedBoundingRect.origin.y;
  width = self->_normalizedBoundingRect.size.width;
  height = self->_normalizedBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

@end
