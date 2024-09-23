@implementation BKDisplayAnnotation

- (BKDisplayAnnotation)init
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  BKDisplayAnnotation *result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDisplayAnnotation *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("use one of the factory methods")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138544642;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BKDisplayAnnotation.m");
    v20 = 1024;
    v21 = 86;
    v22 = 2114;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  result = (BKDisplayAnnotation *)_bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
  return result;
}

- (id)_init
{
  BKDisplayAnnotation *v2;
  uint64_t v3;
  BKDisplayAnnotationLocation *location;
  BKDisplayAnnotationRenderer *v5;
  BKDisplayAnnotationRenderer *renderer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKDisplayAnnotation;
  v2 = -[BKDisplayAnnotation init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationLocation controlledBySupernode](BKDisplayAnnotationLocation, "controlledBySupernode"));
    location = v2->_location;
    v2->_location = (BKDisplayAnnotationLocation *)v3;

    v5 = objc_alloc_init(BKDisplayAnnotationRenderer);
    renderer = v2->_renderer;
    v2->_renderer = v5;

    -[BKDisplayAnnotationRenderer setAnnotation:](v2->_renderer, "setAnnotation:", v2);
  }
  return v2;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotation succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotation succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  v5 = objc_msgSend(v4, "appendObject:withName:", self->_content, CFSTR("content"));
  v6 = objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_section, CFSTR("section"), 1);
  return v4;
}

- (id)description
{
  return -[BKDisplayAnnotation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  BKDisplayAnnotationContent *content;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    content = self->_content;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
    v9 = -[BKDisplayAnnotationContent isEqual:](content, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setRenderer:(id)a3
{
  BKDisplayAnnotationRenderer *v5;
  BKDisplayAnnotationRenderer *v6;

  v5 = (BKDisplayAnnotationRenderer *)a3;
  if (self->_renderer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderer, a3);
    -[BKDisplayAnnotationRenderer setAnnotation:](self->_renderer, "setAnnotation:", self);
    v5 = v6;
  }

}

- (void)setContent:(id)a3
{
  BKDisplayAnnotationContent *v6;
  BKDisplayAnnotationContent *content;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  BKDisplayAnnotationContent *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKDisplayAnnotation *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;

  v6 = (BKDisplayAnnotationContent *)a3;
  content = self->_content;
  if (content != v6)
  {
    if (content)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_content == ((void *)0)")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v9 = NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v12 = (objc_class *)objc_opt_class(self, v11);
        v13 = NSStringFromClass(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138544642;
        v17 = v10;
        v18 = 2114;
        v19 = v14;
        v20 = 2048;
        v21 = self;
        v22 = 2114;
        v23 = CFSTR("BKDisplayAnnotation.m");
        v24 = 1024;
        v25 = 162;
        v26 = 2114;
        v27 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
      __break(0);
      JUMPOUT(0x10008E7A4);
    }
    v15 = v6;
    objc_storeStrong((id *)&self->_content, a3);
    -[BKDisplayAnnotationRenderer styleSheetDidChange](self->_renderer, "styleSheetDidChange");
    v6 = v15;
  }

}

- (void)setLocation:(id)a3
{
  BKDisplayAnnotationLocation *v4;
  BKDisplayAnnotationLocation *location;
  unsigned __int8 v6;
  BKDisplayAnnotationLocation *v7;
  BKDisplayAnnotationLocation *v8;
  BKDisplayAnnotationLocation *v9;

  v4 = (BKDisplayAnnotationLocation *)a3;
  location = self->_location;
  if (location != v4)
  {
    v9 = v4;
    v6 = -[BKDisplayAnnotationLocation isEqual:](location, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (BKDisplayAnnotationLocation *)-[BKDisplayAnnotationLocation copy](v9, "copy");
      v8 = self->_location;
      self->_location = v7;

      -[BKDisplayAnnotationRenderer locationDidChange](self->_renderer, "locationDidChange");
      v4 = v9;
    }
  }

}

- (void)setString:(id)a3
{
  BKDisplayAnnotationContent *content;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  content = self->_content;
  v9 = a3;
  v6 = objc_opt_class(BKDisplayAnnotationStringContent, v5);
  if ((objc_opt_isKindOfClass(content, v6) & 1) != 0)
  {
    -[BKDisplayAnnotationContent setString:](self->_content, "setString:", v9);
    v7 = v9;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStringContent contentWithString:](BKDisplayAnnotationStringContent, "contentWithString:", v9));

    -[BKDisplayAnnotation setContent:](self, "setContent:", v8);
    v7 = (void *)v8;
  }

}

- (void)setShapeSize:(CGSize)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationShapeContent contentWithSize:](BKDisplayAnnotationShapeContent, "contentWithSize:", a3.width, a3.height));
  -[BKDisplayAnnotation setContent:](self, "setContent:", v4);

}

- (void)modifyStyleSheet:(id)a3
{
  (*((void (**)(id, BKDisplayAnnotationStyleSheet *))a3 + 2))(a3, self->_styleSheet);
  -[BKDisplayAnnotationRenderer styleSheetDidChange](self->_renderer, "styleSheetDidChange");
}

- (void)setStyleModifier:(id)a3
{
  -[BKDisplayAnnotationStyleSheet setStyleModifier:](self->_styleSheet, "setStyleModifier:", a3);
  -[BKDisplayAnnotationRenderer styleSheetDidChange](self->_renderer, "styleSheetDidChange");
}

- (BKDisplayAnnotationLocation)location
{
  return self->_location;
}

- (BKDisplayAnnotationRenderer)renderer
{
  return self->_renderer;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)subnodeScreenEdgeTreatment
{
  return self->_subnodeScreenEdgeTreatment;
}

- (void)setSubnodeScreenEdgeTreatment:(int64_t)a3
{
  self->_subnodeScreenEdgeTreatment = a3;
}

- (BKDisplayAnnotationContent)content
{
  return self->_content;
}

- (BKDisplayAnnotationController)annotationController
{
  return (BKDisplayAnnotationController *)objc_loadWeakRetained((id *)&self->_annotationController);
}

- (void)setAnnotationController:(id)a3
{
  objc_storeWeak((id *)&self->_annotationController, a3);
}

- (BKDisplayAnnotationStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setStyleSheet:(id)a3
{
  objc_storeStrong((id *)&self->_styleSheet, a3);
}

- (BKNamespaceNode)namespaceNode
{
  return (BKNamespaceNode *)objc_loadWeakRetained((id *)&self->_namespaceNode);
}

- (void)setNamespaceNode:(id)a3
{
  objc_storeWeak((id *)&self->_namespaceNode, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_namespaceNode);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_destroyWeak((id *)&self->_annotationController);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BKDisplayAnnotation)annotationWithString:(id)a3
{
  id v4;
  id v5;
  BKDisplayAnnotationStyleSheet *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(v5, "setString:", v4);

  v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle textStyle](BKDisplayAnnotationStyle, "textStyle"));
  -[BKDisplayAnnotationStyleSheet setBaseStyle:](v6, "setBaseStyle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle minimalStyle](BKDisplayAnnotationStyle, "minimalStyle"));
  -[BKDisplayAnnotationStyleSheet setStyleModifier:](v6, "setStyleModifier:", v8);

  objc_msgSend(v5, "setStyleSheet:", v6);
  return (BKDisplayAnnotation *)v5;
}

+ (id)subannotationWithString:(id)a3
{
  void *v3;
  BKDisplayAnnotationNullRenderer *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "annotationWithString:", a3));
  v4 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
  objc_msgSend(v3, "setRenderer:", v4);

  return v3;
}

+ (BKDisplayAnnotation)annotationWithEllipseSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  BKDisplayAnnotationStyleSheet *v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v5 = objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(v5, "setShapeSize:", width, height);
  v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle ellipseStyle](BKDisplayAnnotationStyle, "ellipseStyle"));
  -[BKDisplayAnnotationStyleSheet setBaseStyle:](v6, "setBaseStyle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle minimalStyle](BKDisplayAnnotationStyle, "minimalStyle"));
  -[BKDisplayAnnotationStyleSheet setStyleModifier:](v6, "setStyleModifier:", v8);

  objc_msgSend(v5, "setStyleSheet:", v6);
  return (BKDisplayAnnotation *)v5;
}

+ (BKDisplayAnnotation)annotationWithRectangleSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  BKDisplayAnnotationStyleSheet *v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v5 = objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(v5, "setShapeSize:", width, height);
  v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle rectangleStyle](BKDisplayAnnotationStyle, "rectangleStyle"));
  -[BKDisplayAnnotationStyleSheet setBaseStyle:](v6, "setBaseStyle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle minimalStyle](BKDisplayAnnotationStyle, "minimalStyle"));
  -[BKDisplayAnnotationStyleSheet setStyleModifier:](v6, "setStyleModifier:", v8);

  objc_msgSend(v5, "setStyleSheet:", v6);
  return (BKDisplayAnnotation *)v5;
}

+ (BKDisplayAnnotation)new
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  BKDisplayAnnotation *result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("use one of the factory methods")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(a1, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138544642;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = a1;
    v18 = 2114;
    v19 = CFSTR("BKDisplayAnnotation.m");
    v20 = 1024;
    v21 = 91;
    v22 = 2114;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  result = (BKDisplayAnnotation *)_bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
  return result;
}

@end
