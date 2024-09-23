@implementation BKAccessibility

+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
  objc_msgSend(v4, "injectHIDEvent:", a3);

}

+ (void)_accessibilitySetEventTapCallback:(void *)a3
{
  BKSetEventTapCallback(a3, a2);
}

+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3
{
  BKSetHIDEventTapCallback(a3, a2);
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  sub_100035818(0);
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  sub_10000F7A0(0);
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer server](CAWindowServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayWithDisplayId:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  sub_100035818(v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer server](CAWindowServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayWithDisplayId:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  sub_10000F7A0(v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  uint64_t v7;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;

  v7 = *(_QWORD *)&a6;
  y = a3.y;
  x = a3.x;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v17 = objc_msgSend(v15, "eventProcessorOfClass:", objc_opt_class(BKHIDDirectTouchEventProcessor, v16));
  v18 = (id)objc_claimAutoreleasedReturnValue(v17);

  objc_msgSend(v18, "applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", v14, v13, v7, v12, x, y);
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5
{
  return _objc_msgSend(a1, "_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:", *(_QWORD *)&a4, a5, 0, a3.x, a3.y);
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6
{
  uint64_t v6;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;

  v6 = *(_QWORD *)&a6;
  y = a3.y;
  x = a3.x;
  v10 = a5;
  v11 = objc_alloc_init((Class)BKSHIDEventDigitizerPathAttributes);
  objc_msgSend(a1, "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", 0, v11, v6, v10, x, y);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authenticationMessage"));
  return v12;
}

+ (BOOL)_objectWithinProximity
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v4 = objc_msgSend(v2, "eventProcessorOfClass:", objc_opt_class(BKHIDProximityEventProcessor, v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  LOBYTE(v2) = objc_msgSend(v5, "isObjectWithinProximity");
  return (char)v2;
}

+ (BOOL)_isDisplayBacklightOff
{
  float v2;

  os_unfair_lock_lock(&stru_1001172E0);
  v2 = *(float *)&dword_1001172E4;
  os_unfair_lock_unlock(&stru_1001172E0);
  return v2 == 0.0;
}

+ (void)_setCapsLockLightOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v6 = objc_msgSend(v4, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v5));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "setCapsLockLightOn:", v3);
}

@end
