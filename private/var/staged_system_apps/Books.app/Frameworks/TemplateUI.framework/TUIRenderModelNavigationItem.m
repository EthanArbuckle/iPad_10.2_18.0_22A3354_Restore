@implementation TUIRenderModelNavigationItem

- (TUIRenderModelNavigationItem)initWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30
{
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  TUIRenderModelNavigationItem *v45;
  TUIRenderModelNavigationItem *v46;
  TUIIdentifier *v47;
  TUIIdentifier *identifier;
  NSDictionary *v49;
  NSDictionary *imageModelIDToResource;
  NSString *v51;
  NSString *title;
  NSAttributedString *v53;
  NSAttributedString *attributedTitle;
  NSString *v55;
  NSString *text;
  NSAttributedString *v57;
  NSAttributedString *placeholderText;
  NSString *v59;
  NSString *observeTrigger;
  TUIAXAttributes *v61;
  TUIAXAttributes *axAttributes;
  NSArray *v63;
  NSArray *hostingIdentifiers;
  NSArray *v65;
  NSArray *hostingProperties;
  id obj;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  objc_super v80;

  v76 = a4;
  v74 = a5;
  obj = a6;
  v73 = a6;
  v79 = a7;
  v78 = a8;
  v72 = a9;
  v77 = a16;
  v38 = a18;
  v75 = a21;
  v71 = a24;
  v39 = a25;
  v40 = a26;
  v41 = a27;
  v42 = a28;
  v43 = a29;
  v44 = a30;
  v80.receiver = self;
  v80.super_class = (Class)TUIRenderModelNavigationItem;
  v45 = -[TUIRenderModelNavigationItem init](&v80, "init");
  v46 = v45;
  if (v45)
  {
    v45->_itemType = a3;
    v47 = (TUIIdentifier *)objc_msgSend(v76, "copyWithZone:", 0);
    identifier = v46->_identifier;
    v46->_identifier = v47;

    v49 = (NSDictionary *)objc_msgSend(v74, "copy");
    imageModelIDToResource = v46->_imageModelIDToResource;
    v46->_imageModelIDToResource = v49;

    objc_storeStrong((id *)&v46->_actionHandler, obj);
    v51 = (NSString *)objc_msgSend(v79, "copy");
    title = v46->_title;
    v46->_title = v51;

    v46->_searchTextMaxLength = a17;
    v53 = (NSAttributedString *)objc_msgSend(v78, "copy");
    attributedTitle = v46->_attributedTitle;
    v46->_attributedTitle = v53;

    objc_storeStrong((id *)&v46->_image, a9);
    v46->_enabled = a10;
    v46->_buttonType = a11;
    v46->_buttonRole = a12;
    v46->_width = a13;
    v46->_minWidth = a14;
    v46->_maxWidth = a15;
    v55 = (NSString *)objc_msgSend(v77, "copy");
    text = v46->_text;
    v46->_text = v55;

    v57 = (NSAttributedString *)objc_msgSend(v38, "copy");
    placeholderText = v46->_placeholderText;
    v46->_placeholderText = v57;

    v59 = (NSString *)objc_msgSend(v75, "copy");
    observeTrigger = v46->_observeTrigger;
    v46->_observeTrigger = v59;

    v46->_observeTriggerValue = a22;
    v46->_ignoreInsetsForOpacityTrigger = a23;
    objc_storeStrong((id *)&v46->_subviewsModel, a25);
    v46->_navigationBarBackgroundOpacity = a20;
    v46->_keyboardAppearance = a19;
    objc_storeStrong((id *)&v46->_menu, a24);
    v61 = (TUIAXAttributes *)objc_msgSend(v40, "copy");
    axAttributes = v46->_axAttributes;
    v46->_axAttributes = v61;

    objc_storeStrong((id *)&v46->_refId, a27);
    objc_storeStrong((id *)&v46->_refInstance, a28);
    v63 = (NSArray *)objc_msgSend(v43, "copy");
    hostingIdentifiers = v46->_hostingIdentifiers;
    v46->_hostingIdentifiers = v63;

    v65 = (NSArray *)objc_msgSend(v44, "copy");
    hostingProperties = v46->_hostingProperties;
    v46->_hostingProperties = v65;

  }
  return v46;
}

+ (id)renderModelWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30
{
  id v34;
  id v35;
  TUIRenderModelNavigationItem *v36;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  id v51;
  id v56;
  id v57;
  id v58;
  id v59;

  v47 = a30;
  v46 = a29;
  v45 = a28;
  v44 = a27;
  v43 = a26;
  v59 = a25;
  v58 = a24;
  v57 = a21;
  v41 = a18;
  v42 = a16;
  v40 = a9;
  v49 = a8;
  v56 = a7;
  v51 = a6;
  v34 = a5;
  v35 = a4;
  LOBYTE(v39) = a23;
  LOBYTE(v38) = a10;
  v36 = -[TUIRenderModelNavigationItem initWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:]([TUIRenderModelNavigationItem alloc], "initWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:", a3, v35, v34, v51, v56, v49, a13, a14, a15, a20, v40, v38, a11, a12,
          v42,
          a17,
          v41,
          a19,
          v57,
          a22,
          v39,
          v58,
          v59,
          v43,
          v44,
          v45,
          v46,
          v47);

  return v36;
}

- (unint64_t)kind
{
  return 5;
}

- (id)renderItemWithFactory:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  TUINavigationItemView *v8;
  TUIBarButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  TUIBarButtonItem *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem menu](self, "menu"));
  if (objc_msgSend(v5, "isPrimary"))
    v6 = 0;
  else
    v6 = "_takeAction:";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem subviewsModel](self, "subviewsModel"));
  if (v7
    || -[TUIRenderModelNavigationItem buttonType](self, "buttonType")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem attributedTitle](self, "attributedTitle"))) != 0)
  {

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem title](self, "title"));
    if (!v16
      || (v17 = (void *)v16,
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem image](self, "image")),
          v18,
          v17,
          !v18))
    {
      v19 = [TUIBarButtonItem alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem title](self, "title"));
      v9 = -[TUIBarButtonItem initWithTitle:style:target:action:](v19, "initWithTitle:style:target:action:", v20, 0, self, v6);

      -[TUIRenderModelNavigationItem width](self, "width");
      -[TUIBarButtonItem setWidth:](v9, "setWidth:");
      -[TUIRenderModelNavigationItem minWidth](self, "minWidth");
      -[TUIBarButtonItem _setMinimumWidth:](v9, "_setMinimumWidth:");
      -[TUIRenderModelNavigationItem maxWidth](self, "maxWidth");
      -[TUIBarButtonItem _setMaximumWidth:](v9, "_setMaximumWidth:");
      goto LABEL_9;
    }
  }
  v8 = objc_alloc_init(TUINavigationItemView);
  -[TUINavigationItemView setFactory:](v8, "setFactory:", v4);
  -[TUINavigationItemView configureWithModel:](v8, "configureWithModel:", self);
  v9 = -[TUIBarButtonItem initWithCustomView:]([TUIBarButtonItem alloc], "initWithCustomView:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem title](self, "title"));
  -[TUIBarButtonItem setTitle:](v9, "setTitle:", v10);

  -[TUIBarButtonItem setTarget:](v9, "setTarget:", self);
  -[TUIBarButtonItem setAction:](v9, "setAction:", v6);

LABEL_9:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem attributedTitle](self, "attributedTitle"));
  -[TUIBarButtonItem setAttributedTitle:](v9, "setAttributedTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem image](self, "image"));
  -[TUIBarButtonItem setImage:](v9, "setImage:", v12);

  -[TUIBarButtonItem setEnabled:](v9, "setEnabled:", -[TUIRenderModelNavigationItem isEnabled](self, "isEnabled"));
  -[TUIBarButtonItem setButtonType:](v9, "setButtonType:", -[TUIRenderModelNavigationItem buttonType](self, "buttonType"));
  -[TUIBarButtonItem setButtonRole:](v9, "setButtonRole:", -[TUIRenderModelNavigationItem buttonRole](self, "buttonRole"));
  -[TUIRenderModelNavigationItem width](self, "width");
  -[TUIBarButtonItem setButtonWidth:](v9, "setButtonWidth:");
  -[TUIRenderModelNavigationItem minWidth](self, "minWidth");
  -[TUIBarButtonItem setMinButtonWidth:](v9, "setMinButtonWidth:");
  -[TUIRenderModelNavigationItem maxWidth](self, "maxWidth");
  -[TUIBarButtonItem setMaxButtonWidth:](v9, "setMaxButtonWidth:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem imageModelIDToResource](self, "imageModelIDToResource"));
  -[TUIBarButtonItem setImageModelIDToResource:](v9, "setImageModelIDToResource:", v13);

  -[TUIBarButtonItem setMenuModel:](v9, "setMenuModel:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem axAttributes](self, "axAttributes"));
  -[TUIBarButtonItem setAxAttributes:](v9, "setAxAttributes:", v14);

  return v9;
}

- (void)_takeAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v4 = a3;
  v6 = objc_opt_class(UIView, v5);
  v7 = TUIDynamicCast(v6, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_class(UIBarButtonItem, v8);
  v10 = TUIDynamicCast(v9, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_opt_new(NSMutableDictionary);
  if (v14)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, CFSTR("sourceView"));
  if (v11)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, CFSTR("sourceBarButtonItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem actionHandler](self, "actionHandler"));
  objc_msgSend(v13, "invoke:arguments:", CFSTR("press"), v12);

}

- (id)renderViewWithFactory:(id)a3
{
  id v4;
  TUINavigationItemView *v5;

  v4 = a3;
  v5 = objc_alloc_init(TUINavigationItemView);
  -[TUINavigationItemView setFactory:](v5, "setFactory:", v4);

  -[TUINavigationItemView configureWithModel:](v5, "configureWithModel:", self);
  return v5;
}

- (id)renderSearchControllerWithFactory:(id)a3
{
  id v4;
  TUISearchController *v5;

  v4 = a3;
  v5 = objc_alloc_init(TUISearchController);
  -[TUISearchController setFactory:](v5, "setFactory:", v4);

  -[TUISearchController configureWithModel:](v5, "configureWithModel:", self);
  return v5;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSString *title;
  NSAttributedString *attributedTitle;
  UIImage *image;
  NSString *text;
  NSAttributedString *placeholderText;
  NSString *observeTrigger;
  NSDictionary *imageModelIDToResource;
  TUIElementActionTriggerHandler *actionHandler;
  TUIMenuModel *menu;
  TUIRenderModelSubviews *subviewsModel;
  unsigned __int8 v19;

  v4 = a3;
  v6 = objc_opt_class(TUIRenderModelNavigationItem, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);

  if (!TUIRenderModelIsEqualToRenderModel(self, (void *)v8))
    goto LABEL_32;
  title = self->_title;
  if (title != *(NSString **)(v8 + 32) && !-[NSString isEqualToString:](title, "isEqualToString:"))
    goto LABEL_32;
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != *(NSAttributedString **)(v8 + 40)
    && !-[NSAttributedString isEqualToAttributedString:](attributedTitle, "isEqualToAttributedString:"))
  {
    goto LABEL_32;
  }
  if (((image = self->_image, image == *(UIImage **)(v8 + 48)) || -[UIImage isEqual:](image, "isEqual:"))
    && self->_enabled == *(unsigned __int8 *)(v8 + 8)
    && self->_buttonType == *(_QWORD *)(v8 + 56)
    && self->_buttonRole == *(_QWORD *)(v8 + 64)
    && self->_width == *(double *)(v8 + 72)
    && self->_minWidth == *(double *)(v8 + 80)
    && self->_maxWidth == *(double *)(v8 + 88)
    && ((text = self->_text, text == *(NSString **)(v8 + 96)) || -[NSString isEqualToString:](text, "isEqualToString:"))
    && ((placeholderText = self->_placeholderText, placeholderText == *(NSAttributedString **)(v8 + 104))
     || -[NSAttributedString isEqualToAttributedString:](placeholderText, "isEqualToAttributedString:"))
    && self->_keyboardAppearance == *(_QWORD *)(v8 + 112)
    && self->_navigationBarBackgroundOpacity == *(double *)(v8 + 152)
    && ((observeTrigger = self->_observeTrigger, observeTrigger == *(NSString **)(v8 + 120))
     || -[NSString isEqualToString:](observeTrigger, "isEqualToString:"))
    && self->_observeTriggerValue == *(_QWORD *)(v8 + 128)
    && self->_itemType == *(_QWORD *)(v8 + 136)
    && ((imageModelIDToResource = self->_imageModelIDToResource, imageModelIDToResource == *(NSDictionary **)(v8 + 208))
     || -[NSDictionary isEqualToDictionary:](imageModelIDToResource, "isEqualToDictionary:"))
    && ((actionHandler = self->_actionHandler, actionHandler == *(TUIElementActionTriggerHandler **)(v8 + 216))
     || -[TUIElementActionTriggerHandler isEqualToHandler:](actionHandler, "isEqualToHandler:"))
    && ((menu = self->_menu, menu == *(TUIMenuModel **)(v8 + 160)) || -[TUIMenuModel isEqual:](menu, "isEqual:")))
  {
    subviewsModel = self->_subviewsModel;
    if (subviewsModel == *(TUIRenderModelSubviews **)(v8 + 224))
      v19 = 1;
    else
      v19 = -[TUIRenderModelSubviews isEqualToRenderModel:](subviewsModel, "isEqualToRenderModel:");
  }
  else
  {
LABEL_32:
    v19 = 0;
  }

  return v19;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
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

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (double)width
{
  return self->_width;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (unint64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (NSString)observeTrigger
{
  return self->_observeTrigger;
}

- (unint64_t)observeTriggerValue
{
  return self->_observeTriggerValue;
}

- (BOOL)ignoreInsetsForOpacityTrigger
{
  return self->_ignoreInsetsForOpacityTrigger;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (int64_t)searchTextMaxLength
{
  return self->_searchTextMaxLength;
}

- (double)navigationBarBackgroundOpacity
{
  return self->_navigationBarBackgroundOpacity;
}

- (TUIMenuModel)menu
{
  return self->_menu;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (NSArray)hostingProperties
{
  return self->_hostingProperties;
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (TUIRenderModelSubviews)subviewsModel
{
  return self->_subviewsModel;
}

- (void)setSubviewsModel:(id)a3
{
  objc_storeStrong((id *)&self->_subviewsModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsModel, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_observeTrigger, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
