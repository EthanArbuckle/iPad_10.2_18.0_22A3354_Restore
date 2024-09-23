@implementation TUIRenderModelInteractive

- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 actionHandler:(id)a7 viewState:(id)a8 enabled:(BOOL)a9 pressScale:(double)a10 touchInsets:(UIEdgeInsets)a11
{
  uint64_t v12;

  LOBYTE(v12) = a9;
  return -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](self, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a5, a6, 0, a7, a10, a11.top, a11.left, a11.bottom, a11.right, a8, v12, 0, 0, 0,
           0);
}

- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 imageModelIDToResource:(id)a7 actionHandler:(id)a8 viewState:(id)a9 enabled:(BOOL)a10 pressScale:(double)a11 touchInsets:(UIEdgeInsets)a12 pointer:(id)a13 focusStyle:(id)a14 menu:(id)a15 name:(id)a16
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  TUIRenderModelInteractive *v36;
  TUIIdentifier *v37;
  TUIIdentifier *identifier;
  NSString *v39;
  NSString *reuseIdentifier;
  NSDictionary *v41;
  NSDictionary *stateToModel;
  NSDictionary *v43;
  NSDictionary *imageModelIDToResource;
  NSString *v45;
  NSString *name;
  id obj;
  id v49;
  id v51;
  id v52;
  id v53;
  objc_super v54;

  right = a12.right;
  bottom = a12.bottom;
  left = a12.left;
  top = a12.top;
  v26 = a3;
  v27 = a4;
  obj = a5;
  v53 = a5;
  v28 = a6;
  v29 = a7;
  v49 = a8;
  v30 = a8;
  v31 = v28;
  v52 = v30;
  v51 = a9;
  v32 = a13;
  v33 = a14;
  v34 = a15;
  v35 = a16;
  v54.receiver = self;
  v54.super_class = (Class)TUIRenderModelInteractive;
  v36 = -[TUIRenderModelInteractive init](&v54, "init");
  if (v36)
  {
    v37 = (TUIIdentifier *)objc_msgSend(v27, "copyWithZone:", 0);
    identifier = v36->_identifier;
    v36->_identifier = v37;

    v39 = (NSString *)objc_msgSend(v26, "copy");
    reuseIdentifier = v36->_reuseIdentifier;
    v36->_reuseIdentifier = v39;

    objc_storeStrong((id *)&v36->_style, obj);
    v41 = (NSDictionary *)objc_msgSend(v31, "copy");
    stateToModel = v36->_stateToModel;
    v36->_stateToModel = v41;

    v43 = (NSDictionary *)objc_msgSend(v29, "copy");
    imageModelIDToResource = v36->_imageModelIDToResource;
    v36->_imageModelIDToResource = v43;

    v45 = (NSString *)objc_msgSend(v35, "copy");
    name = v36->_name;
    v36->_name = v45;

    objc_storeStrong((id *)&v36->_pointer, a13);
    objc_storeStrong((id *)&v36->_focusStyle, a14);
    objc_storeStrong((id *)&v36->_menu, a15);
    objc_storeStrong((id *)&v36->_viewState, a9);
    v36->_enabled = a10;
    v36->_pressScale = a11;
    v36->_touchInsets.top = top;
    v36->_touchInsets.left = left;
    v36->_touchInsets.bottom = bottom;
    v36->_touchInsets.right = right;
    objc_storeStrong((id *)&v36->_actionHandler, v49);
  }

  return v36;
}

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  return -[NSDictionary allValues](self->_stateToModel, "allValues");
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p stateToModel=%@, enabled=%d>"), v5, self, self->_stateToModel, self->_enabled));

  return (NSString *)v6;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  __int128 v7;
  NSDictionary *stateToModel;
  __int128 v9;
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a3;
  v11[1] = 3221225472;
  v7 = *(_OWORD *)&a4->c;
  v13 = *(_OWORD *)&a4->a;
  stateToModel = self->_stateToModel;
  v11[0] = _NSConcreteStackBlock;
  v11[2] = sub_14DEF0;
  v11[3] = &unk_2428B0;
  v12 = v6;
  v9 = *(_OWORD *)&a4->tx;
  v14 = v7;
  v15 = v9;
  v10 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](stateToModel, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  __int128 v13;
  NSDictionary *stateToModel;
  __int128 v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19[1] = 3221225472;
  v13 = *(_OWORD *)&a4->c;
  v23 = *(_OWORD *)&a4->a;
  stateToModel = self->_stateToModel;
  v19[0] = _NSConcreteStackBlock;
  v19[2] = sub_14E014;
  v19[3] = &unk_2428D8;
  v15 = *(_OWORD *)&a4->tx;
  v24 = v13;
  v25 = v15;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](stateToModel, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  return -[TUIRenderModelInteractive _copyAppearanceWithFlags:statesCopyProc:](self, "_copyAppearanceWithFlags:statesCopyProc:", a3, TUIElementStateRenderModelMapCopyForInitialAppearanceWithFlags);
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  return -[TUIRenderModelInteractive _copyAppearanceWithFlags:statesCopyProc:](self, "_copyAppearanceWithFlags:statesCopyProc:", a3, TUIElementStateRenderModelMapCopyForFinalAppearanceWithFlags);
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  unsigned __int8 *v10;
  NSString *reuseIdentifier;
  NSString *name;
  NSDictionary *stateToModel;
  NSDictionary *imageModelIDToResource;
  TUIRenderStyling *style;
  TUIElementActionTriggerHandler *actionHandler;
  TUIMenuModel *menu;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(self);
    if (v5 == objc_opt_class(v4))
    {
      v8 = (unsigned __int8 *)v4;
    }
    else
    {
      v6 = objc_opt_class(TUIRenderModelInteractive);
      v7 = TUIDynamicCast(v6, v4);
      v8 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(v7);
    }
    v10 = v8;
    if (TUIRenderModelIsEqualToRenderModel(self, v8)
      && self->_viewState == (TUIMutableDynamicValue *)*((_QWORD *)v10 + 6)
      && ((reuseIdentifier = self->_reuseIdentifier, reuseIdentifier == *((NSString **)v10 + 4))
       || -[NSString isEqualToString:](reuseIdentifier, "isEqualToString:"))
      && ((name = self->_name, name == *((NSString **)v10 + 10))
       || -[NSString isEqualToString:](name, "isEqualToString:"))
      && self->_enabled == v10[8]
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_touchInsets.top, *(float64x2_t *)(v10 + 136)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_touchInsets.bottom, *(float64x2_t *)(v10 + 152)))), 0xFuLL))) & 1) != 0&& ((stateToModel = self->_stateToModel, stateToModel == *((NSDictionary **)v10 + 8))|| -[NSDictionary isEqual:](stateToModel, "isEqual:"))&& ((imageModelIDToResource = self->_imageModelIDToResource, imageModelIDToResource == *((NSDictionary **)v10 + 9))|| -[NSDictionary isEqualToDictionary:](imageModelIDToResource, "isEqualToDictionary:"))&& ((style = self->_style, style == *((TUIRenderStyling **)v10 + 7))|| -[TUIRenderStyling isEqualToStyle:](style, "isEqualToStyle:"))&& ((actionHandler = self->_actionHandler, actionHandler == *((TUIElementActionTriggerHandler **)v10 + 5))|| -[TUIElementActionTriggerHandler isEqualToHandler:](actionHandler, "isEqualToHandler:")))
    {
      menu = self->_menu;
      if (menu == *((TUIMenuModel **)v10 + 13))
        v9 = 1;
      else
        v9 = -[TUIMenuModel isEqual:](menu, "isEqual:");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7;
  NSString *reuseIdentifier;
  TUIIdentifier *identifier;
  TUIRenderStyling *style;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;

  v7 = objc_alloc((Class)objc_opt_class(self));
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  style = self->_style;
  v11 = ((uint64_t (*)(NSDictionary *, unint64_t))a4)(self->_stateToModel, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  LOBYTE(v15) = self->_enabled;
  v13 = objc_msgSend(v7, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", reuseIdentifier, identifier, style, v12, self->_imageModelIDToResource, self->_actionHandler, self->_pressScale, self->_touchInsets.top, self->_touchInsets.left, self->_touchInsets.bottom, self->_touchInsets.right, self->_viewState, v15, self->_pointer, self->_focusStyle, self->_menu,
          self->_name);

  TUIRenderModelCopyProperties(v13, self);
  return v13;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (TUIRenderStyling)style
{
  return self->_style;
}

- (NSDictionary)stateToModel
{
  return self->_stateToModel;
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (NSString)name
{
  return self->_name;
}

- (TUIPointer)pointer
{
  return self->_pointer;
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (TUIMenuModel)menu
{
  return self->_menu;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)pressScale
{
  return self->_pressScale;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
  objc_storeStrong((id *)&self->_pointer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_stateToModel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
