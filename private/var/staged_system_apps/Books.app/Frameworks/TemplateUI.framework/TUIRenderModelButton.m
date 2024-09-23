@implementation TUIRenderModelButton

- (TUIRenderModelButton)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 stateToButtonAttributes:(id)a6 stateToRenderModel:(id)a7 imageModelIDToResource:(id)a8 actionHandler:(id)a9 viewState:(id)a10 linkEntities:(id)a11 type:(unint64_t)a12 role:(unint64_t)a13 userInterfaceStyle:(unint64_t)a14 enabled:(BOOL)a15 pressScale:(double)a16 touchInsets:(UIEdgeInsets)a17 pointer:(id)a18 focusStyle:(id)a19 menu:(id)a20 contextMenuIsPrimaryAction:(BOOL)a21 name:(id)a22 axAttributes:(id)a23 enableBackgroundForHighlightPreview:(BOOL)a24 enableShadowForHighlightPreview:(BOOL)a25
{
  double right;
  double bottom;
  double left;
  double top;
  id v32;
  id v33;
  id v34;
  TUIRenderModelButton *v35;
  NSArray *v36;
  NSArray *linkEntities;
  NSDictionary *v38;
  NSDictionary *stateToButtonAttributes;
  objc_super v46;

  right = a17.right;
  bottom = a17.bottom;
  left = a17.left;
  top = a17.top;
  v32 = a6;
  v33 = a11;
  v34 = a23;
  v46.receiver = self;
  v46.super_class = (Class)TUIRenderModelButton;
  v35 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v46, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a5, a7, a8, a9, a16, top, left, bottom, right, a10, a15, a18, a19, a20,
          a22);
  if (v35)
  {
    v36 = (NSArray *)objc_msgSend(v33, "copy");
    linkEntities = v35->_linkEntities;
    v35->_linkEntities = v36;

    v38 = (NSDictionary *)objc_msgSend(v32, "copy");
    stateToButtonAttributes = v35->_stateToButtonAttributes;
    v35->_stateToButtonAttributes = v38;

    v35->_type = a12;
    v35->_role = a13;
    v35->_userInterfaceStyle = a14;
    objc_storeStrong((id *)&v35->_axAttributes, a23);
    v35->_contextMenuIsPrimaryAction = a21;
    v35->_enableBackgroundForHighlightPreview = a24;
    v35->_enableShadowForHighlightPreview = a25;
  }

  return v35;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id type;
  id role;
  id userInterfaceStyle;
  NSDictionary *stateToButtonAttributes;
  uint64_t v12;
  void *v13;
  NSDictionary *v14;
  void *v15;
  TUIAXAttributesProviding *axAttributes;
  TUIAXAttributesProviding *v17;
  BOOL v18;
  int contextMenuIsPrimaryAction;
  objc_super v21;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelButton);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v21.receiver = self;
  v21.super_class = (Class)TUIRenderModelButton;
  if (!-[TUIRenderModelInteractive isEqualToRenderModel:](&v21, "isEqualToRenderModel:", v7))
    goto LABEL_10;
  type = (id)self->_type;
  if (type != objc_msgSend(v7, "type"))
    goto LABEL_10;
  role = (id)self->_role;
  if (role != objc_msgSend(v7, "role"))
    goto LABEL_10;
  userInterfaceStyle = (id)self->_userInterfaceStyle;
  if (userInterfaceStyle != objc_msgSend(v7, "userInterfaceStyle"))
    goto LABEL_10;
  stateToButtonAttributes = self->_stateToButtonAttributes;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateToButtonAttributes"));
  if (stateToButtonAttributes == (NSDictionary *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    v14 = self->_stateToButtonAttributes;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateToButtonAttributes"));
    LODWORD(v14) = -[NSDictionary isEqualToDictionary:](v14, "isEqualToDictionary:", v15);

    if (!(_DWORD)v14)
      goto LABEL_10;
  }
  axAttributes = self->_axAttributes;
  v17 = (TUIAXAttributesProviding *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "axAttributes"));

  if (axAttributes == v17)
  {
    contextMenuIsPrimaryAction = self->_contextMenuIsPrimaryAction;
    v18 = contextMenuIsPrimaryAction == objc_msgSend(v7, "contextMenuIsPrimaryAction");
    goto LABEL_11;
  }
LABEL_10:
  v18 = 0;
LABEL_11:

  return v18;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t type;
  unint64_t role;
  unsigned int v8;
  NSDictionary *stateToButtonAttributes;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  type = self->_type;
  role = self->_role;
  v8 = -[TUIRenderModelInteractive enabled](self, "enabled");
  stateToButtonAttributes = self->_stateToButtonAttributes;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p type=%lu role=%lu enabled=%d stateToAttr=%@ stateToModel=%@>"), v5, self, type, role, v8, stateToButtonAttributes, v10));

  return v11;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  TUIRenderModelButton *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v40 = objc_alloc((Class)objc_opt_class(self));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive style](self, "style"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelButton stateToButtonAttributes](self, "stateToButtonAttributes"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v7 = ((uint64_t (*)(void *, unint64_t))a4)(v45, a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive imageModelIDToResource](self, "imageModelIDToResource"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelButton linkEntities](self, "linkEntities"));
  v35 = -[TUIRenderModelButton type](self, "type");
  v34 = -[TUIRenderModelButton role](self, "role");
  v33 = -[TUIRenderModelButton userInterfaceStyle](self, "userInterfaceStyle");
  v32 = -[TUIRenderModelInteractive enabled](self, "enabled");
  -[TUIRenderModelInteractive pressScale](self, "pressScale");
  v9 = v8;
  -[TUIRenderModelInteractive touchInsets](self, "touchInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive pointer](self, "pointer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive focusStyle](self, "focusStyle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive menu](self, "menu"));
  v18 = -[TUIRenderModelButton contextMenuIsPrimaryAction](self, "contextMenuIsPrimaryAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelButton axAttributes](self, "axAttributes"));
  v21 = -[TUIRenderModelButton enableBackgroundForHighlightPreview](self, "enableBackgroundForHighlightPreview");
  BYTE1(v26) = -[TUIRenderModelButton enableShadowForHighlightPreview](self, "enableShadowForHighlightPreview");
  LOBYTE(v26) = v21;
  LOBYTE(v25) = v18;
  LOBYTE(v24) = v32;
  v41 = objc_msgSend(v40, "initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", v44, v43, v42, v39, v38, v37, v9, v11, v13, v15, v17, v31, v30, v36, v35,
          v34,
          v33,
          v24,
          v29,
          v28,
          v27,
          v25,
          v19,
          v20,
          v26);

  TUIRenderModelCopyProperties(v41, self);
  v22 = self;

  return v22;
}

- (NSDictionary)stateToButtonAttributes
{
  return self->_stateToButtonAttributes;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)role
{
  return self->_role;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (TUIAXAttributesProviding)axAttributes
{
  return self->_axAttributes;
}

- (BOOL)contextMenuIsPrimaryAction
{
  return self->_contextMenuIsPrimaryAction;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (BOOL)enableShadowForHighlightPreview
{
  return self->_enableShadowForHighlightPreview;
}

- (BOOL)enableBackgroundForHighlightPreview
{
  return self->_enableBackgroundForHighlightPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_stateToButtonAttributes, 0);
}

@end
