@implementation TUIMicaPlayerBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(_TUIMicaPlayerBoxLayout, a2);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
  objc_storeStrong((id *)&self->_gravity, a3);
}

- (NSString)textKey
{
  return self->_textKey;
}

- (void)setTextKey:(id)a3
{
  objc_storeStrong((id *)&self->_textKey, a3);
}

- (NSString)textValue
{
  return self->_textValue;
}

- (void)setTextValue:(id)a3
{
  objc_storeStrong((id *)&self->_textValue, a3);
}

- (BOOL)shouldStartAtEnd
{
  return self->_shouldStartAtEnd;
}

- (void)setShouldStartAtEnd:(BOOL)a3
{
  self->_shouldStartAtEnd = a3;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)setTriggerName:(id)a3
{
  objc_storeStrong((id *)&self->_triggerName, a3);
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (void)setTriggerDelay:(double)a3
{
  self->_triggerDelay = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (NSString)resourceKind
{
  return self->_resourceKind;
}

- (void)setResourceKind:(id)a3
{
  objc_storeStrong((id *)&self->_resourceKind, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceKind, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textKey, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
