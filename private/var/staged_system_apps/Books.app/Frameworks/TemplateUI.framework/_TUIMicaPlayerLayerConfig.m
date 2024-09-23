@implementation _TUIMicaPlayerLayerConfig

- (_TUIMicaPlayerLayerConfig)initWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 contentScale:(double)a11 opacity:(double)a12 fontSpec:(id)a13 fileProvider:(id)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _TUIMicaPlayerLayerConfig *v29;
  _TUIMicaPlayerLayerConfig *v30;
  id obj;
  id v33;
  id v35;
  id v36;
  objc_super v37;

  v23 = a3;
  v24 = a4;
  obj = a5;
  v25 = a5;
  v33 = a6;
  v35 = a8;
  v36 = a6;
  v26 = a8;
  v27 = a13;
  v28 = a14;
  v37.receiver = self;
  v37.super_class = (Class)_TUIMicaPlayerLayerConfig;
  v29 = -[_TUIMicaPlayerLayerConfig init](&v37, "init");
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_url, a3);
    objc_storeStrong((id *)&v30->_gravity, a4);
    objc_storeStrong((id *)&v30->_textKey, obj);
    objc_storeStrong((id *)&v30->_textValue, v33);
    v30->_shouldStartAtEnd = a7;
    objc_storeStrong((id *)&v30->_triggerName, v35);
    v30->_targetTriggerState = a9;
    v30->_triggerDelay = a10;
    v30->_contentScale = a11;
    v30->_opacity = a12;
    objc_storeStrong((id *)&v30->_fontSpec, a13);
    objc_storeWeak((id *)&v30->_fileProvider, v28);
  }

  return v30;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p url=%@>"), v5, self, self->_url));

  return (NSString *)v6;
}

- (void)configureBounds:(id)a3
{
  objc_msgSend(a3, "updateContent");
}

- (void)configureLayer:(id)a3
{
  double contentScale;
  id v5;
  double opacity;
  NSURL *url;
  NSString *gravity;
  NSString *textKey;
  NSString *textValue;
  _BOOL8 shouldStartAtEnd;
  NSString *triggerName;
  unint64_t targetTriggerState;
  double triggerDelay;
  TUIFileResourceProviding **p_fileProvider;
  TUIFontSpec *fontSpec;
  id WeakRetained;

  contentScale = self->_contentScale;
  v5 = a3;
  objc_msgSend(v5, "setContentsScale:", contentScale);
  objc_msgSend(v5, "setRasterizationScale:", self->_contentScale);
  opacity = self->_opacity;
  *(float *)&opacity = opacity;
  objc_msgSend(v5, "setOpacity:", opacity);
  url = self->_url;
  gravity = self->_gravity;
  textKey = self->_textKey;
  textValue = self->_textValue;
  shouldStartAtEnd = self->_shouldStartAtEnd;
  triggerName = self->_triggerName;
  targetTriggerState = self->_targetTriggerState;
  triggerDelay = self->_triggerDelay;
  p_fileProvider = &self->_fileProvider;
  fontSpec = self->_fontSpec;
  WeakRetained = objc_loadWeakRetained((id *)p_fileProvider);
  objc_msgSend(v5, "configWithURL:gravity:textKey:textValue:shouldStartAtEnd:triggerName:targetTriggerState:triggerDelay:fontSpec:fileProvider:", url, gravity, textKey, textValue, shouldStartAtEnd, triggerName, triggerDelay, targetTriggerState, fontSpec, WeakRetained);

}

- (BOOL)isEqualToConfig:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSURL *url;
  NSURL *v10;
  NSURL *v11;
  void *v12;
  BOOL v13;
  NSString *gravity;
  NSString *v15;
  NSString *v16;
  NSString *textKey;
  NSString *v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  NSString *textValue;
  NSString *v24;
  NSString *v25;
  int shouldStartAtEnd;
  NSString *triggerName;
  NSString *v28;
  NSString *v29;
  id targetTriggerState;
  double triggerDelay;
  double v32;
  double opacity;
  double v34;
  BOOL v35;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  NSString *v41;
  void *v42;
  NSString *v43;
  void *v44;

  v5 = a3;
  v6 = objc_opt_class(_TUIMicaPlayerLayerConfig);
  v7 = TUIDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    url = self->_url;
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
    if (url != v10)
    {
      v11 = self->_url;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
      if (!-[NSURL isEqual:](v11, "isEqual:", v12))
      {
        v13 = 0;
        goto LABEL_36;
      }
      v44 = v12;
    }
    gravity = self->_gravity;
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gravity"));
    if (gravity != v15)
    {
      v16 = self->_gravity;
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gravity"));
      if (!-[NSString isEqualToString:](v16, "isEqualToString:", v3))
      {
        v13 = 0;
        v12 = v44;
LABEL_34:

LABEL_35:
        if (url == v10)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    textKey = self->_textKey;
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textKey"));
    v43 = textKey;
    if (textKey != v18)
    {
      v19 = self->_textKey;
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textKey"));
      v21 = v19;
      v22 = (void *)v20;
      if (!-[NSString isEqualToString:](v21, "isEqualToString:", v20))
      {
        v13 = 0;
LABEL_32:

LABEL_33:
        v12 = v44;
        if (gravity == v15)
          goto LABEL_35;
        goto LABEL_34;
      }
      v40 = v22;
    }
    textValue = self->_textValue;
    v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textValue"));
    v41 = textValue;
    v42 = v3;
    if (textValue != v24)
    {
      v25 = self->_textValue;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textValue"));
      if (!-[NSString isEqualToString:](v25, "isEqualToString:"))
      {
        v13 = 0;
        v3 = v42;
LABEL_30:

LABEL_31:
        v22 = v40;
        if (v43 == v18)
          goto LABEL_33;
        goto LABEL_32;
      }
    }
    shouldStartAtEnd = self->_shouldStartAtEnd;
    if (shouldStartAtEnd != objc_msgSend(v8, "shouldStartAtEnd"))
    {
      v13 = 0;
      goto LABEL_29;
    }
    triggerName = self->_triggerName;
    v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "triggerName"));
    v38 = triggerName;
    if (triggerName == v28
      || (v29 = self->_triggerName,
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "triggerName")),
          -[NSString isEqualToString:](v29, "isEqualToString:")))
    {
      targetTriggerState = (id)self->_targetTriggerState;
      if (targetTriggerState == objc_msgSend(v8, "targetTriggerState")
        && (triggerDelay = self->_triggerDelay, objc_msgSend(v8, "triggerDelay"), triggerDelay == v32))
      {
        opacity = self->_opacity;
        objc_msgSend(v8, "opacity");
        v13 = opacity == v34;
        v35 = opacity == v34;
      }
      else
      {
        v13 = 0;
        v35 = 0;
      }
      if (v38 == v28)
      {

        v13 = v35;
LABEL_29:
        v3 = v42;
        if (v41 == v24)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_29;
  }
  v13 = 0;
LABEL_38:

  return v13;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(_TUIMicaPlayerLayer, a2);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)gravity
{
  return self->_gravity;
}

- (NSString)textKey
{
  return self->_textKey;
}

- (NSString)textValue
{
  return self->_textValue;
}

- (BOOL)shouldStartAtEnd
{
  return self->_shouldStartAtEnd;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (double)opacity
{
  return self->_opacity;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (TUIFileResourceProviding)fileProvider
{
  return (TUIFileResourceProviding *)objc_loadWeakRetained((id *)&self->_fileProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileProvider);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textKey, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
