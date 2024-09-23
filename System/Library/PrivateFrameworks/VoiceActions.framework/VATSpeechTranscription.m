@implementation VATSpeechTranscription

- (VATSpeechTranscription)initWithFormattedString:(id)a3 locale:(id)a4 confidence:(double)a5 minConfidence:(double)a6 maxConfidence:(double)a7
{
  id v13;
  id v14;
  VATSpeechTranscription *v15;
  VATSpeechTranscription *v16;
  VATSpeechTranscription *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VATSpeechTranscription;
  v15 = -[VATSpeechTranscription init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_locale, a4);
    objc_storeStrong((id *)&v16->_formattedString, a3);
    v16->_maxConfidence = a7;
    v16->_confidence = a5;
    v16->_minConfidence = a6;
    v16->_lowConfidence = 0;
    v17 = v16;
  }

  return v16;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (NSString)sanitizedFormattedString
{
  return self->_sanitizedFormattedString;
}

- (double)minConfidence
{
  return self->_minConfidence;
}

- (double)maxConfidence
{
  return self->_maxConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedFormattedString, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
