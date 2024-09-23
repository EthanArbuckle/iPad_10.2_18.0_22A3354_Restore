@implementation TSDLayoutController

- (id)th_traitsCache
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = objc_msgSend(objc_msgSend(-[TSDLayoutController canvas](self, "canvas"), "canvasController"), "layerHost");
  v3 = TSUCheckedProtocolCast(&OBJC_PROTOCOL___THiOSTraitsCacheHosting, v2);
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      v5 = THLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_2712E0(v5);
    }
  }
  return objc_msgSend(v4, "traitsCache");
}

- (BOOL)isCompactWidth
{
  return objc_msgSend(-[TSDLayoutController th_traitsCache](self, "th_traitsCache"), "isCompactWidth");
}

- (BOOL)isCompactHeight
{
  return objc_msgSend(-[TSDLayoutController th_traitsCache](self, "th_traitsCache"), "isCompactHeight");
}

@end
