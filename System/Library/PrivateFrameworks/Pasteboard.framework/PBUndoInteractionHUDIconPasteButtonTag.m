@implementation PBUndoInteractionHUDIconPasteButtonTag

- (PBUndoInteractionHUDIconPasteButtonTag)initWithMinWidth:(double)a3
{
  PBUndoInteractionHUDIconPasteButtonTag *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUndoInteractionHUDIconPasteButtonTag;
  result = -[PBUndoInteractionHUDIconPasteButtonTag init](&v5, sel_init);
  if (result)
    result->_minWidth = a3;
  return result;
}

- (PBUndoInteractionHUDIconPasteButtonTag)initWithCoder:(id)a3
{
  id v4;
  PBUndoInteractionHUDIconPasteButtonTag *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBUndoInteractionHUDIconPasteButtonTag;
  v5 = -[PBPasteButtonTag initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minWidth"));
    v5->_minWidth = v6;
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  if (objc_msgSend(a3, "userInterfaceStyle"))
    return 0xC59AA8F622F26FCLL;
  else
    return 0x237A2046F04E760CLL;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "displayScale");
  v5 = objc_msgSend(v3, "displayScale");

  return ($BEA516A46C1BA1F84587E5D243A711F7)((0x1600000000 * v5) | (v4 << 49) | (v4 << 17) | (22 * v5));
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  uint64_t v3;
  float result;

  v3 = objc_msgSend(a3, "userInterfaceStyle");
  result = NAN;
  if (v3 == 1)
    result = 1.0;
  if (!v3)
    return 0.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUndoInteractionHUDIconPasteButtonTag;
  v4 = a3;
  -[PBPasteButtonTag encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minWidth"), self->_minWidth, v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  return +[PBUndoInteractionHUDIconPasteButtonTag hash](PBUndoInteractionHUDIconPasteButtonTag, "hash") ^ (unint64_t)self->_minWidth;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_minWidth == v4[1];

  return v5;
}

- (BOOL)isValid
{
  double v2;

  v2 = fabs(self->_minWidth);
  return v2 > INFINITY || v2 < INFINITY;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PBUndoInteractionHUDIconPasteButtonTag_resolvedStyleForStyle___block_invoke;
  v8[3] = &unk_1E2430C60;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v5, "copyWithChangeBlock:", v8);

  return v6;
}

void __64__PBUndoInteractionHUDIconPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAccessibilityButtonShapes:", 0);
  objc_msgSend(v3, "setAccessibilityContrast:", 0);
  objc_msgSend(v3, "setDisplayRange:", 0);
  objc_msgSend(v3, "setLocalization:", CFSTR("en"));
  objc_msgSend(v3, "setPreferredContentSizeCategory:", 3);
  objc_msgSend(v3, "setTintColor:", objc_msgSend(*(id *)(a1 + 32), "baseForegroundColorForStyle:", *(_QWORD *)(a1 + 40)));

}

- (unsigned)secureNameForStyle:(id)a3
{
  return 0x10000;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  if (!a5)
    return 0;
  (*((void (**)(id, PBUndoInteractionHUDIconPasteButtonTag *, id, id))a5 + 2))(a5, self, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)minWidth
{
  return self->_minWidth;
}

@end
