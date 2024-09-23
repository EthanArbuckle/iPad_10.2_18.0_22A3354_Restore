@implementation CRLQuickInspectorElement

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9 crlaxLabel:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CRLQuickInspectorElement *v21;
  CRLQuickInspectorElement *v22;
  id v23;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)CRLQuickInspectorElement;
  v21 = -[CRLQuickInspectorElement init](&v25, "init");
  v22 = v21;
  if (v21)
  {
    -[CRLQuickInspectorElement setName:](v21, "setName:", v16);
    -[CRLQuickInspectorElement setImage:](v22, "setImage:", v17);
    -[CRLQuickInspectorElement setElementType:](v22, "setElementType:", a5);
    -[CRLQuickInspectorElement setOptions:](v22, "setOptions:", a6);
    -[CRLQuickInspectorElement setAction:](v22, "setAction:", a7);
    -[CRLQuickInspectorElement setParent:](v22, "setParent:", v18);
    -[CRLQuickInspectorElement setChildren:](v22, "setChildren:", v19);
    if (v20)
      v23 = v20;
    else
      v23 = v16;
    -[CRLQuickInspectorElement setCrlaxLabel:](v22, "setCrlaxLabel:", v23);
    -[CRLQuickInspectorElement setTag:](v22, "setTag:", -1);
  }

  return v22;
}

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6
{
  return -[CRLQuickInspectorElement initWithName:image:type:options:action:parent:children:crlaxLabel:](self, "initWithName:image:type:options:action:parent:children:crlaxLabel:", a3, a4, a5, a6, 0, 0, 0, 0);
}

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8
{
  return -[CRLQuickInspectorElement initWithName:image:type:options:action:parent:children:crlaxLabel:](self, "initWithName:image:type:options:action:parent:children:crlaxLabel:", a3, a4, a5, 0, a6, a7, a8, 0);
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6
{
  id v9;
  id v10;
  CRLQuickInspectorElement *v11;

  v9 = a4;
  v10 = a3;
  v11 = -[CRLQuickInspectorElement initWithName:image:type:options:]([CRLQuickInspectorElement alloc], "initWithName:image:type:options:", v10, v9, a5, a6);

  return v11;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 crlaxLabel:(id)a7
{
  id v11;
  id v12;
  id v13;
  CRLQuickInspectorElement *v14;

  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = -[CRLQuickInspectorElement initWithName:image:type:options:action:parent:children:crlaxLabel:]([CRLQuickInspectorElement alloc], "initWithName:image:type:options:action:parent:children:crlaxLabel:", v13, v12, a5, a6, 0, 0, 0, v11);

  return v14;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6
{
  id v9;
  id v10;
  CRLQuickInspectorElement *v11;

  v9 = a4;
  v10 = a3;
  v11 = -[CRLQuickInspectorElement initWithName:image:type:action:parent:children:]([CRLQuickInspectorElement alloc], "initWithName:image:type:action:parent:children:", v10, v9, a5, a6, 0, 0);

  return v11;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  CRLQuickInspectorElement *v17;

  v13 = a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = -[CRLQuickInspectorElement initWithName:image:type:action:parent:children:]([CRLQuickInspectorElement alloc], "initWithName:image:type:action:parent:children:", v16, v15, a5, a6, v14, v13);

  return v17;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CRLQuickInspectorElement *v19;

  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  v19 = -[CRLQuickInspectorElement initWithName:image:type:options:action:parent:children:crlaxLabel:]([CRLQuickInspectorElement alloc], "initWithName:image:type:options:action:parent:children:crlaxLabel:", v18, v17, a5, a6, a7, v16, v15, 0);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(CRLQuickInspectorElement, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement name](self, "name"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    if (v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10))
    {
      v27 = 0;
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement image](self, "image"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
      if ((!(v11 | v12) || objc_msgSend((id)v11, "isEqual:", v12))
        && (v13 = -[CRLQuickInspectorElement elementType](self, "elementType"), v13 == objc_msgSend(v8, "elementType"))
        && (v14 = -[CRLQuickInspectorElement options](self, "options"), v14 == objc_msgSend(v8, "options"))
        && sel_isEqual(-[CRLQuickInspectorElement action](self, "action"), (SEL)objc_msgSend(v8, "action")))
      {
        v15 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement parent](self, "parent"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
        if (v15 | v16 && !objc_msgSend((id)v15, "isEqual:", v16))
        {
          v27 = 0;
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement children](self, "children"));
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children"));
          if (v17 | v18 && !objc_msgSend((id)v17, "isEqual:", v18))
          {
            v27 = 0;
          }
          else
          {
            v34 = v16;
            v19 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement tintColor](self, "tintColor"));
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tintColor"));
            v21 = v19;
            v22 = (void *)v20;
            v33 = (void *)v21;
            if (v21 | v20 && !objc_msgSend((id)v21, "isEqual:", v20))
            {
              v27 = 0;
            }
            else
            {
              v31 = v22;
              v32 = v18;
              v23 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement crlaxLabel](self, "crlaxLabel"));
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxLabel"));
              if (v23 | v24 && !objc_msgSend((id)v23, "isEqual:", v24))
              {
                v27 = 0;
              }
              else
              {
                v29 = v15;
                v30 = v17;
                v25 = objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement toolTip](self, "toolTip"));
                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toolTip"));
                if (v25 | v26)
                {
                  v27 = objc_msgSend((id)v25, "isEqual:", v26);

                }
                else
                {
                  v27 = 1;
                }
                v15 = v29;

                v17 = v30;
              }

              v22 = v31;
              v18 = v32;
            }

            v16 = v34;
          }

        }
      }
      else
      {
        v27 = 0;
      }

    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  NSString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement name](self, "name"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement image](self, "image"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = -[CRLQuickInspectorElement elementType](self, "elementType");
  v8 = v6 ^ v7 ^ -[CRLQuickInspectorElement options](self, "options");
  v9 = NSStringFromSelector(-[CRLQuickInspectorElement action](self, "action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (unint64_t)objc_msgSend(v10, "hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement parent](self, "parent"));
  v13 = v8 ^ v11 ^ (unint64_t)objc_msgSend(v12, "hash");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement children](self, "children"));
  v15 = (unint64_t)objc_msgSend(v14, "hash");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement tintColor](self, "tintColor"));
  v17 = v15 ^ (unint64_t)objc_msgSend(v16, "hash");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement crlaxLabel](self, "crlaxLabel"));
  v19 = v17 ^ (unint64_t)objc_msgSend(v18, "hash");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement toolTip](self, "toolTip"));
  v21 = v13 ^ v19 ^ (unint64_t)objc_msgSend(v20, "hash");

  return v21;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRLImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(int64_t)a3
{
  self->_elementType = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (CRLColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)crlaxLabel
{
  return self->_crlaxLabel;
}

- (void)setCrlaxLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (void)setToolTip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTip, 0);
  objc_storeStrong((id *)&self->_crlaxLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)elementWithUIMenuElement:(id)a3 ofType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  CRLQuickInspectorElement *v18;
  void *v19;
  void *v20;
  int64_t v21;
  id v22;
  CRLQuickInspectorElement *v23;
  CRLQuickInspectorElement *v24;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithUIImage:](CRLImage, "imageWithUIImage:", v7));
  objc_opt_class(UICommand, v9);
  v11 = sub_100221D0C(v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_opt_class(UIMenu, v13);
  v15 = sub_100221D0C(v14, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v12)
  {
    v17 = objc_msgSend(v12, "action");
    v18 = [CRLQuickInspectorElement alloc];
    v19 = v6;
    v20 = v8;
    v21 = a4;
    v22 = v17;
  }
  else
  {
    if (v16)
    {
      v23 = (CRLQuickInspectorElement *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithUIMenu:](CRLQuickInspectorElement, "elementWithUIMenu:", v16));
      goto LABEL_6;
    }
    v18 = [CRLQuickInspectorElement alloc];
    v19 = v6;
    v20 = v8;
    v21 = a4;
    v22 = 0;
  }
  v23 = -[CRLQuickInspectorElement initWithName:image:type:action:parent:children:](v18, "initWithName:image:type:action:parent:children:", v19, v20, v21, v22, 0, 0);
LABEL_6:
  v24 = v23;

  return v24;
}

+ (id)elementWithUIMenuElement:(id)a3
{
  return +[CRLQuickInspectorElement elementWithUIMenuElement:ofType:](CRLQuickInspectorElement, "elementWithUIMenuElement:ofType:", a3, 1);
}

+ (id)elementWithUIMenu:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CRLQuickInspectorElement *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithUIImage:](CRLImage, "imageWithUIImage:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "children"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithUIMenuElement:](CRLQuickInspectorElement, "elementWithUIMenuElement:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[CRLQuickInspectorElement initWithName:image:type:action:parent:children:]([CRLQuickInspectorElement alloc], "initWithName:image:type:action:parent:children:", v15, v5, 1, 0, 0, v6);
  return v13;
}

- (UIMenuElement)UIMenuElement
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement children](self, "children"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement children](self, "children", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UIMenuElement"));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UIMenuElement"));
            objc_msgSend(v5, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement name](self, "name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement image](self, "image"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UIImage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v14, v16, 0, 1, v5));

    return (UIMenuElement *)v17;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement name](self, "name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLQuickInspectorElement image](self, "image"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UIImage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v19, v21, -[CRLQuickInspectorElement action](self, "action"), 0));

    return (UIMenuElement *)v22;
  }
}

@end
