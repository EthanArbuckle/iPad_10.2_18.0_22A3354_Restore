@implementation TSDRep

- (int)performanceMode
{
  return objc_msgSend(objc_msgSend(-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THPerformanceCoordinator), "performanceMode");
}

- (BOOL)canExpand
{
  return TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[TSDRep infoForPressable](self, "infoForPressable")) == 0;
}

- (unint64_t)widgetInteractionMode
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWInteractionModeHosting);
  if (result)
    return (unint64_t)objc_msgSend((id)result, "widgetInteractionModeForRep:", self);
  return result;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 0;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 0;
}

- (id)popUpInfo
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = -[TSDRep infoForPressable](self, "infoForPressable");
  v3 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, v2);
  if (v3)
  {
    v4 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, objc_msgSend(v3, "popUpInfo"));
    if (v4)
      v2 = (id)v4;
  }
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpInfo, v2);
}

- (int)pressableAction
{
  id v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;

  v3 = objc_msgSend(-[TSDRep infoForPressable](self, "infoForPressable"), "repClass");
  if (-[TSDRep popUpInfo](self, "popUpInfo"))
  {
    v4 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v5 = TSUDynamicCast(v4, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    v7 = v6;
    if (((objc_msgSend(v6, "isCompactWidth", v5) & 1) != 0
       || objc_msgSend(v7, "isCompactHeight"))
      && (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandableRep) & 1) != 0)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandableRep))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (BOOL)allowsAction:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v22;

  v5 = objc_opt_class(THWAudioRep);
  TSUDynamicCast(v5, self);
  v7 = v6;
  v8 = objc_opt_class(THWIOSMovieRep);
  TSUDynamicCast(v8, self);
  v10 = v9;
  v11 = objc_opt_class(THWViewportRep);
  TSUDynamicCast(v11, self);
  v13 = v12;
  v14 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v15 = TSUDynamicCast(v14, self).n128_u64[0];
  v17 = v16;
  v18 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[TSDRep infoForPressable](self, "infoForPressable", v15));
  v20 = v18;
  if (a3 == 2)
  {
    v22 = (TSUPhoneUI(v18, v19) & 1) != 0 || objc_msgSend(v20, "popUpInfo") == 0;
    return !(v17 | v7 | v10) && v22;
  }
  else
  {
    return a3 != 1 || !v13 && objc_msgSend(v18, "popUpInfo") != 0;
  }
}

@end
