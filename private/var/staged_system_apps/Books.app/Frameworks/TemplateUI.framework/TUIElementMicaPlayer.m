@implementation TUIElementMicaPlayer

+ (id)supportedAttributes
{
  if (qword_2CB1D8 != -1)
    dispatch_once(&qword_2CB1D8, &stru_23DAF0);
  return (id)qword_2CB1D0;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIMicaPlayerBox, a2);
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 213, var0));
  objc_msgSend(v11, "setUrlString:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseURLForNode:", var0));
  objc_msgSend(v11, "setBaseURL:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 117, var0));
  v23 = (id)objc_claimAutoreleasedReturnValue(+[TUIBox layerContentsGravityFromString:](TUIBox, "layerContentsGravityFromString:", v14));

  objc_msgSend(v11, "setGravity:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 132, var0));
  objc_msgSend(v11, "setTextKey:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 133, var0));
  objc_msgSend(v11, "setTextValue:", v16);

  objc_msgSend(v11, "setShouldStartAtEnd:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 195, 0, var0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 142, var0));
  objc_msgSend(v11, "setTriggerName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 144, var0));
  v19 = +[TUIBox triggerStateFromString:](TUIBox, "triggerStateFromString:", v18);

  objc_msgSend(v11, "setTargetTriggerState:", v19);
  objc_msgSend(v10, "floatForAttribute:node:", 143, var0);
  objc_msgSend(v11, "setTriggerDelay:");
  objc_msgSend(v10, "floatForAttribute:node:", 146, var0);
  if (v20 == 0.0)
    v20 = 1.0;
  objc_msgSend(v11, "setOpacity:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontSpecForNode:", var0));
  objc_msgSend(v11, "setFontSpec:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 172, var0));
  objc_msgSend(v11, "setResourceKind:", v22);

}

- ($738B17BD11CC339B30296C0EA03CEC2B)urlString
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_urlString.offset;
}

- (void)setUrlString:(id)a3
{
  self->_urlString.offset = a3.var0;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)textKey
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_textKey.offset;
}

- (void)setTextKey:(id)a3
{
  self->_textKey.offset = a3.var0;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)textValue
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_textValue.offset;
}

- (void)setTextValue:(id)a3
{
  self->_textValue.offset = a3.var0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
