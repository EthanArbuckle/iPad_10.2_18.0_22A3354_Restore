@implementation _DUIImageComponent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIImageComponent)initWithCoder:(id)a3
{
  id v4;
  _DUIImageComponent *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DUIImageComponent;
  v5 = -[_DUIImageComponent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", CFSTR("origin"));
    v5->_origin.x = v6;
    v5->_origin.y = v7;
    v5->_origin.z = v8;
    objc_msgSend(v4, "decodeUISize3DForKey:", CFSTR("size"));
    v5->_size.width = v9;
    v5->_size.height = v10;
    v5->_size.depth = v11;
    v5->_ignoresAccessibilityFilters = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresAccessibilityFilters"));
    v5->_slotID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("slotID"));
    v5->_renderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("renderID"));
    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("contextID"));
    v5->_hidesImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidesImage"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double z;
  id v7;

  x = self->_origin.x;
  y = self->_origin.y;
  z = self->_origin.z;
  v7 = a3;
  objc_msgSend(v7, "ui_encodeCAPoint3D:forKey:", CFSTR("origin"), x, y, z);
  objc_msgSend(v7, "encodeUISize3D:forKey:", CFSTR("size"), self->_size.width, self->_size.height, self->_size.depth);
  objc_msgSend(v7, "encodeBool:forKey:", self->_ignoresAccessibilityFilters, CFSTR("ignoresAccessibilityFilters"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_slotID, CFSTR("slotID"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_renderID, CFSTR("renderID"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_contextID, CFSTR("contextID"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_hidesImage, CFSTR("hidesImage"));

}

- (void)setFrame:(CGRect)a3
{
  self->_origin.x = a3.origin.x;
  self->_origin.y = a3.origin.y;
  self->_origin.z = 0.0;
  self->_size.width = a3.size.width;
  self->_size.height = a3.size.height;
  self->_size.depth = 0.0;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_origin.x;
  y = self->_origin.y;
  width = self->_size.width;
  height = self->_size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)size3D
{
  double width;
  double height;
  double depth;
  $1AB5FA073B851C12C2339EC22442E995 result;

  width = self->_size.width;
  height = self->_size.height;
  depth = self->_size.depth;
  result.var2 = depth;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setSize3D:(id)a3
{
  self->_size = ($411A14B09BA96096A1FE7E58B287F14F)a3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[_DUIImageComponent slotID](self, "slotID");
  v6 = -[_DUIImageComponent renderID](self, "renderID");
  v7 = -[_DUIImageComponent contextID](self, "contextID");
  -[_DUIImageComponent frame](self, "frame");
  NSStringFromCGRect(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: slotID=%u renderID=%llx contextID:%x frame=%@ hidesImage=%d>"), v4, self, v5, v6, v7, v8, -[_DUIImageComponent hidesImage](self, "hidesImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)representsPortal
{
  return self->_renderID && self->_contextID != 0;
}

- (void)_configurePortalLayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSourceLayerRenderId:", -[_DUIImageComponent renderID](self, "renderID"));
  objc_msgSend(v4, "setSourceContextId:", -[_DUIImageComponent contextID](self, "contextID"));
  objc_msgSend(v4, "setHidesSourceLayer:", 1);
  -[_DUIImageComponent frame](self, "frame");
  objc_msgSend(v4, "setFrame:");

}

- (id)portalView
{
  _UIPortalView *v3;
  _UIPortalView *v4;
  void *v5;

  v3 = [_UIPortalView alloc];
  v4 = -[_UIPortalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UIPortalView portalLayer](v4, "portalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUIImageComponent _configurePortalLayer:](self, "_configurePortalLayer:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v8 = CAPoint3DEqualToPoint()
      && (self->_size.width == v5[4] ? (v6 = self->_size.height == v5[5]) : (v6 = 0),
          v6 ? (v7 = self->_size.depth == v5[6]) : (v7 = 0),
          v7
       && self->_ignoresAccessibilityFilters == *((unsigned __int8 *)v5 + 56)
       && self->_slotID == *((_DWORD *)v5 + 15)
       && self->_renderID == *((_QWORD *)v5 + 9)
       && self->_contextID == *((_DWORD *)v5 + 16))
      && self->_hidesImage == *((unsigned __int8 *)v5 + 57);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_renderID ^ self->_slotID ^ self->_contextID;
}

- (id)createSnapshotViewForPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *v16;
  _UIDragSlotHostingView *v17;
  _UIDragSlotHostingView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v4 = a3;
  -[_DUIImageComponent imageComponent](self, "imageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = [UIView alloc];
    v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v14);
    -[UIView setBounds:](v16, "setBounds:", v8, v10, v12, v14);
    if (objc_msgSend(v6, "representsPortal"))
    {
      objc_msgSend(v6, "portalView");
      v17 = (_UIDragSlotHostingView *)objc_claimAutoreleasedReturnValue();
      -[_UIDragSlotHostingView setAllowsHitTesting:](v17, "setAllowsHitTesting:", objc_msgSend(v4, "previewMode") == 4);
    }
    else
    {
      v18 = [_UIDragSlotHostingView alloc];
      objc_msgSend(v6, "frame");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v6, "size3D");
      v17 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v18, "initWithFrame:contentSize:slotID:", objc_msgSend(v6, "slotID"), v20, v22, v24, v26, v27, v28, v29);
    }
    -[UIView addSubview:](v16, "addSubview:", v17);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)ignoresAccessibilityFilters
{
  return self->_ignoresAccessibilityFilters;
}

- (void)setIgnoresAccessibilityFilters:(BOOL)a3
{
  self->_ignoresAccessibilityFilters = a3;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_renderID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void)setHidesImage:(BOOL)a3
{
  self->_hidesImage = a3;
}

@end
