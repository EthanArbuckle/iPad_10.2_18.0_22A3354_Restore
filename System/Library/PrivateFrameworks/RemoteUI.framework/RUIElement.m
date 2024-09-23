@implementation RUIElement

- (OpaqueJSClass)_JSClass
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  OpaqueJSClass *v9;
  void *v10;
  void *v11;
  void *v12;
  JSStaticValue *v13;
  unint64_t v14;
  JSObjectSetPropertyCallback *p_setProperty;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  JSStaticValue *v20;
  void *v21;
  void *v22;
  void *v23;
  JSStaticFunction *v24;
  unint64_t v25;
  JSPropertyAttributes *p_attributes;
  void *v27;
  void *v28;
  void *v29;
  JSStaticFunction *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  JSClassDefinition v36;

  v3 = (void *)_JSClass_cache;
  if (!_JSClass_cache)
  {
    v4 = objc_opt_new();
    v5 = (void *)_JSClass_cache;
    _JSClass_cache = v4;

    v3 = (void *)_JSClass_cache;
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (OpaqueJSClass *)objc_msgSend(v8, "pointerValue");
  }
  else
  {
    -[RUIElement _ruielement_staticValues](self, "_ruielement_staticValues", *MEMORY[0x24BDDA880], *(_QWORD *)(MEMORY[0x24BDDA880] + 8), *(_QWORD *)(MEMORY[0x24BDDA880] + 16), *(_QWORD *)(MEMORY[0x24BDDA880] + 24), *(_QWORD *)(MEMORY[0x24BDDA880] + 32), *(_QWORD *)(MEMORY[0x24BDDA880] + 40), *(_QWORD *)(MEMORY[0x24BDDA880] + 48), *(_QWORD *)(MEMORY[0x24BDDA880] + 56), *(_QWORD *)(MEMORY[0x24BDDA880] + 64), *(_QWORD *)(MEMORY[0x24BDDA880] + 72), *(_QWORD *)(MEMORY[0x24BDDA880] + 80), *(_QWORD *)(MEMORY[0x24BDDA880] + 88), *(_QWORD *)(MEMORY[0x24BDDA880] + 96), *(_QWORD *)(MEMORY[0x24BDDA880] + 104), *(_QWORD *)(MEMORY[0x24BDDA880] + 112), *(_QWORD *)(MEMORY[0x24BDDA880] + 120));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[RUIElement staticValues](self, "staticValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    v13 = (JSStaticValue *)malloc_type_malloc(32 * objc_msgSend(v11, "count") + 32, 0x10D004053594A2BuLL);
    if (objc_msgSend(v11, "count"))
    {
      v14 = 0;
      p_setProperty = &v13->setProperty;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(p_setProperty - 2) = (JSObjectSetPropertyCallback)objc_msgSend(v16, "identifier");

        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(p_setProperty - 1) = (JSObjectSetPropertyCallback)objc_msgSend(v17, "getter");

        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *p_setProperty = (JSObjectSetPropertyCallback)objc_msgSend(v18, "setter");

        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *((_DWORD *)p_setProperty + 2) = objc_msgSend(v19, "JSPropertyAttributes");

        ++v14;
        p_setProperty += 4;
      }
      while (v14 < objc_msgSend(v11, "count"));
    }
    v20 = &v13[objc_msgSend(v11, "count")];
    *(_OWORD *)&v20->name = 0u;
    *(_OWORD *)&v20->setProperty = 0u;
    v36.staticValues = v13;
    -[RUIElement _ruielement_staticFunctions](self, "_ruielement_staticFunctions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    -[RUIElement staticFunctions](self, "staticFunctions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v23);

    v24 = (JSStaticFunction *)malloc_type_malloc(24 * objc_msgSend(v22, "count") + 24, 0x10D00402EF37E45uLL);
    if (objc_msgSend(v22, "count"))
    {
      v25 = 0;
      p_attributes = &v24->attributes;
      do
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)p_attributes - 2) = objc_msgSend(v27, "identifier");

        objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)p_attributes - 1) = objc_msgSend(v28, "function");

        objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *p_attributes = objc_msgSend(v29, "JSPropertyAttributes");
        p_attributes += 6;

        ++v25;
      }
      while (v25 < objc_msgSend(v22, "count"));
    }
    v30 = &v24[objc_msgSend(v22, "count")];
    v30->callAsFunction = 0;
    *(_QWORD *)&v30->attributes = 0;
    v30->name = 0;
    v36.staticFunctions = v24;
    v36.initialize = (JSObjectInitializeCallback)RUIJSElement_initialize;
    v36.finalize = (JSObjectFinalizeCallback)RUIJSElement_finalize;
    v9 = JSClassCreate(&v36);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)_JSClass_cache;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v34);

    free(v13);
    free(v24);

  }
  return v9;
}

- (OpaqueJSValue)JSValueForContext:(OpaqueJSContext *)a3
{
  RUIElement *v4;

  v4 = self;
  return JSObjectMake(a3, -[RUIElement _JSClass](v4, "_JSClass"), v4);
}

- (id)_ruielement_staticValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "identifier");
  objc_msgSend(v2, "setGetter:", RUIJSElement_getProperty);
  objc_msgSend(v2, "setSetter:", 0);
  objc_msgSend(v2, "setJSPropertyAttributes:", 10);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "page");
  objc_msgSend(v3, "setGetter:", RUIJSElement_getProperty);
  objc_msgSend(v3, "setSetter:", 0);
  objc_msgSend(v3, "setJSPropertyAttributes:", 10);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIdentifier:", "body");
  objc_msgSend(v4, "setGetter:", RUIJSElement_getProperty);
  objc_msgSend(v4, "setSetter:", RUIJSElement_setProperty);
  objc_msgSend(v4, "setJSPropertyAttributes:", 8);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setIdentifier:", "enabled");
  objc_msgSend(v5, "setGetter:", RUIJSElement_getProperty);
  objc_msgSend(v5, "setSetter:", RUIJSElement_setProperty);
  objc_msgSend(v5, "setJSPropertyAttributes:", 8);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)staticValues
{
  return 0;
}

- (id)_ruielement_staticFunctions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "activate");
  objc_msgSend(v2, "setFunction:", RUIJSElement_activate);
  objc_msgSend(v2, "setJSPropertyAttributes:", 0);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "getAttribute");
  objc_msgSend(v3, "setFunction:", RUIJSElement_getAttribute);
  objc_msgSend(v3, "setJSPropertyAttributes:", 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)staticFunctions
{
  return 0;
}

- (RUIElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  RUIElement *v8;
  RUIElement *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RUIElement;
  v8 = -[RUIElement init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_enabled = 1;
    objc_storeWeak((id *)&v8->_parent, v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setEnabled:](v9, "setEnabled:", objc_msgSend(v10, "BOOLValue") ^ 1);

    -[RUIElement setAttributes:](v9, "setAttributes:", v6);
  }

  return v9;
}

- (RUIElement)init
{
  RUIElement *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIElement;
  result = -[RUIElement init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)performAction:(int)a3 completion:(id)a4
{
  -[RUIElement performAction:forElement:completion:](self, "performAction:forElement:completion:", *(_QWORD *)&a3, self, a4);
}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  uint64_t v17;

  v6 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[RUIElement parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RUIElement parent](self, "parent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performAction:forElement:completion:", v6, v8, v9);

  }
  else
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 67109378;
        v14[1] = v6;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "Dropping action %i on the floor for element %@", (uint8_t *)v14, 0x12u);
      }

    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.RemoteUI"), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v13);

    }
  }

}

- (id)subElementsWithName:(id)a3
{
  return 0;
}

- (id)subElementWithID:(id)a3
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setAttributes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *attributes;
  id v6;

  if (self->_attributes != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    attributes = self->_attributes;
    self->_attributes = v4;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[RUIElement setIdentifier:](self, "setIdentifier:", v6);

  }
}

- (id)mutableAttributes
{
  NSMutableDictionary *attributes;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  attributes = self->_attributes;
  if (!attributes)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_attributes;
    self->_attributes = v4;

    attributes = self->_attributes;
  }
  return attributes;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)RUIElement;
  -[RUIElement dealloc](&v5, sel_dealloc);
}

- (id)sourceURL
{
  void *v2;
  void *v3;

  -[RUIElement parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pageElement
{
  RUIElement *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self;
  }
  else
  {
    -[RUIElement parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageElement");
    v3 = (RUIElement *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (RUIStyle)style
{
  RUIStyle *style;
  RUIStyle *v3;
  void *v4;

  style = self->_style;
  if (style)
  {
    v3 = style;
  }
  else
  {
    -[RUIElement parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v3 = (RUIStyle *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)name
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("name"));
}

- (id)URLAttributeForImageName:(id)a3 getScale:(double *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v38[0] = &unk_24C2B1F60;
  v38[1] = &unk_24C2B1F70;
  v39[0] = CFSTR("3x");
  v39[1] = CFSTR("2x");
  v38[2] = &unk_24C2B1F80;
  v39[2] = &stru_24C29B280;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_6:
    objc_msgSend(v10, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v17;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v31 = a4;
      v32 = v12;
      v20 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v22, v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringByAppendingString:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v15 = (void *)v25;
            if (v31)
            {
              objc_msgSend(v22, "doubleValue");
              *(_QWORD *)v31 = v26;
            }

            goto LABEL_18;
          }

        }
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v19)
          continue;
        break;
      }
      v15 = 0;
LABEL_18:
      v12 = v32;
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_21;
  }
  objc_msgSend(v6, "stringByAppendingString:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!a4 || !v14)
  {

    if (v15)
      goto LABEL_22;
    goto LABEL_6;
  }
  *a4 = v9;
LABEL_21:

LABEL_22:
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v15, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIElement sourceURL](self, "sourceURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v27, v28);
    else
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
    v27 = v15;
  }

  return v29;
}

uint64_t __48__RUIElement_URLAttributeForImageName_getScale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (int)_horizontalAlignmentForString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("left")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("center")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("right")) & 1) != 0)
    {
      v5 = 3;
    }
    else
    {
      NSLog(CFSTR("Warning: Unrecognized alignment string '%@'. Valid values are 'left', 'center' and 'right'"), v3);
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)imageLoaded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;

  v12 = -1.0;
  -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("image"), &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "imageForURL:loadIfAbsent:", v4, 0);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v6, 0, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElement setImage:](self, "setImage:", v7);

    }
    objc_msgSend(v5, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = RUIImageLoaderDidLoadImageNotification;
    objc_msgSend(v4, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v11, 0);

  }
}

- (BOOL)hasImage
{
  void *v3;
  BOOL v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("systemImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("image"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)loadImage
{
  return -[RUIElement loadSystemImage](self, "loadSystemImage")
      || -[RUIElement loadImageFromImageURL](self, "loadImageFromImageURL");
}

- (id)_symbolConfigurationWithRenderingMode:(id)a3 tintColor:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("hierarchical")))
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithHierarchicalColor:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v7;
    goto LABEL_7;
  }
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("palette"));
  v9 = (void *)MEMORY[0x24BEBD660];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "unspecifiedConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4
{
  return -[RUIElement systemImageNamed:symbolRenderingMode:tintColor:](self, "systemImageNamed:symbolRenderingMode:tintColor:", a3, a4, 0);
}

- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5
{
  void *v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v7 = (void *)MEMORY[0x24BEBD640];
  if (a5)
  {
    v9 = a4;
    v10 = a3;
    -[RUIElement _symbolConfigurationWithRenderingMode:tintColor:](self, "_symbolConfigurationWithRenderingMode:tintColor:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_systemImageNamed:withConfiguration:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x24BEBD4B8];
    v14 = a4;
    v15 = a3;
    objc_msgSend(v13, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement _symbolConfigurationWithRenderingMode:tintColor:](self, "_symbolConfigurationWithRenderingMode:tintColor:", v14, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_systemImageNamed:withConfiguration:", v15, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)customSymbolImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BEBD640];
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = a3;
  objc_msgSend(v9, "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("symbolRenderingMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RUIElement _symbolConfigurationWithRenderingMode:tintColor:](self, "_symbolConfigurationWithRenderingMode:tintColor:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement _symbolConfigurationWithRenderingMode:tintColor:](self, "_symbolConfigurationWithRenderingMode:tintColor:", v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", v10, v11, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)v15;
  }

  return v14;
}

- (BOOL)loadSystemImage
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  uint64_t v21;
  void *v22;
  void *v23;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("systemImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("tintColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("symbolRenderingMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement systemImageNamed:symbolRenderingMode:tintColor:](self, "systemImageNamed:symbolRenderingMode:tintColor:", v3, v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("symbolRenderingMode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElement customSymbolImageNamed:symbolRenderingMode:tintColor:](self, "customSymbolImageNamed:symbolRenderingMode:tintColor:", v3, v9, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v6 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v10 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("systemImageWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("systemImageHeight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      v15 = v10;
      v16 = v11;
      if (!v14)
      {
LABEL_13:
        if (v15 != v10 || v16 != v11)
        {
          -[RUIElement image:size:](self, "image:size:", v8, v15, v16);
          v21 = objc_claimAutoreleasedReturnValue();

          -[RUIElement setImageSize:](self, "setImageSize:", v15, v16);
          v8 = (void *)v21;
        }
        -[RUIElement setImage:](self, "setImage:", v8);
        if (v5)
          -[RUIElement setTintColor:](self, "setTintColor:", v5);
        -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageAlign"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageAlign"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUIElement setImageAlignment:](self, "setImageAlignment:", -[RUIElement _horizontalAlignmentForString:](self, "_horizontalAlignmentForString:", v23));

        }
        -[RUIElement setImage:](self, "setImage:", v8);

        v6 = 1;
        goto LABEL_23;
      }
      -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("systemImageWidth"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v15 = v18;

      -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("systemImageHeight"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v16 = v19;
    }
    else
    {
      v15 = v10;
      v16 = v11;
    }

    goto LABEL_13;
  }
  v6 = 0;
LABEL_24:

  return v6;
}

- (id)image:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  CGSize v12;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (!v6 || (width == *MEMORY[0x24BDBF148] ? (v7 = height == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v7 = 0), v7))
  {
    v10 = 0;
  }
  else
  {
    v12.width = width;
    v12.height = height;
    UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    v10 = v6;
  }

  return v10;
}

- (BOOL)loadImageFromImageURL
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v24;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  const void *v30;
  double v31;

  v31 = -1.0;
  -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("image"), &v31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_16;
  +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "imageForURL:loadIfAbsent:", v3, 1);
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v5, 0, v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageWidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v18 = v20;

    -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageHeight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v17 = v22;

    goto LABEL_10;
  }
  -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageWidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {

LABEL_7:
    v8 = 0;
    v12 = 1;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageHeight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");
  v28 = v27;

  v29 = LICreateDefaultIcon();
  if (v29)
  {
    v30 = (const void *)v29;
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v29, 0, v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v30);
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v8 = 0;
  }
LABEL_8:
  objc_msgSend(v4, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = RUIImageLoaderDidLoadImageNotification;
  objc_msgSend(v3, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_imageLoaded_, v16, 0);

  v17 = v7;
  v18 = v6;
  if (v12)
    goto LABEL_9;
LABEL_10:
  -[RUIElement setImage:](self, "setImage:", v8);
  if (v18 != v6 || v17 != v7)
    -[RUIElement setImageSize:](self, "setImageSize:", v18, v17);
  -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("imageAlign"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement setImageAlignment:](self, "setImageAlignment:", -[RUIElement _horizontalAlignmentForString:](self, "_horizontalAlignmentForString:", v24));

LABEL_16:
  return v3 != 0;
}

- (id)textStyleWithString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[11];
  _QWORD v19[12];

  v19[11] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BEBE210];
  v18[0] = CFSTR("largeTitle");
  v18[1] = CFSTR("title1");
  v4 = *MEMORY[0x24BEBE240];
  v19[0] = v3;
  v19[1] = v4;
  v5 = *MEMORY[0x24BEBE248];
  v18[2] = CFSTR("title2");
  v18[3] = CFSTR("title3");
  v6 = *MEMORY[0x24BEBE250];
  v19[2] = v5;
  v19[3] = v6;
  v7 = *MEMORY[0x24BEBE200];
  v18[4] = CFSTR("headline");
  v18[5] = CFSTR("subheadline");
  v8 = *MEMORY[0x24BEBE220];
  v19[4] = v7;
  v19[5] = v8;
  v9 = *MEMORY[0x24BEBE1D0];
  v18[6] = CFSTR("body");
  v18[7] = CFSTR("callout");
  v10 = *MEMORY[0x24BEBE1D8];
  v19[6] = v9;
  v19[7] = v10;
  v11 = *MEMORY[0x24BEBE1F0];
  v18[8] = CFSTR("footnote");
  v18[9] = CFSTR("caption1");
  v12 = *MEMORY[0x24BEBE1E0];
  v19[8] = v11;
  v19[9] = v12;
  v18[10] = CFSTR("caption2");
  v19[10] = *MEMORY[0x24BEBE1E8];
  v13 = (void *)MEMORY[0x24BDBCE70];
  v14 = a3;
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v19, v18, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)configureAccessiblityWithTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessibilityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[RUIElement identifier](self, "identifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v4, "setAccessibilityIdentifier:", v9);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (RUIElement)parent
{
  return (RUIElement *)objc_loadWeakRetained((id *)&self->_parent);
}

- (RUIXMLElement)sourceXMLElement
{
  return self->_sourceXMLElement;
}

- (void)setSourceXMLElement:(id)a3
{
  objc_storeStrong((id *)&self->_sourceXMLElement, a3);
}

- (BOOL)wantsInlineActivityIndicator
{
  return self->_wantsInlineActivityIndicator;
}

- (void)setWantsInlineActivityIndicator:(BOOL)a3
{
  self->_wantsInlineActivityIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceXMLElement, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
