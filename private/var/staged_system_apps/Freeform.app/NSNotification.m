@implementation NSNotification

+ (id)CRLSearchStringChanged
{
  if (qword_1013DCAC0 != -1)
    swift_once(&qword_1013DCAC0, sub_100583F54);
  return (id)qword_10147EA30;
}

+ (id)CRLTextInputResponderDidBecomeFirstResponder
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCBB8, &qword_10147ED30, (uint64_t)sub_10064871C);
}

+ (id)CRLTextInputResponderDidResignFirstResponder
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCBC0, &qword_10147ED38, (uint64_t)sub_10064875C);
}

+ (id)CRLTextInputResponderDidReloadInputViewsWithChangedEditor
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCBC8, &qword_10147ED40, (uint64_t)sub_1006487D8);
}

+ (id)CRLCommandControllerDidOpenUndoGroup
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCD78, &qword_10147F038, (uint64_t)sub_1006A52CC);
}

+ (id)CRLCommandControllerWillCloseUndoGroup
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCD80, &qword_10147F040, (uint64_t)sub_1006A530C);
}

+ (id)CRLCommandControllerDidCloseUndoGroup
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCD88, &qword_10147F048, (uint64_t)sub_1006A534C);
}

+ (id)CRLCommandControllerHistoryStateDidChange
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCD90, (id *)&qword_10147F050, (uint64_t)sub_1006A538C);
}

+ (id)CRLCommandControllerWillUndo
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCD98, &qword_10147F058, (uint64_t)sub_1006A53CC);
}

+ (id)CRLCommandControllerDidUndo
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCDA0, &qword_10147F060, (uint64_t)sub_1006A540C);
}

+ (id)CRLCommandControllerWillRedo
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCDA8, &qword_10147F068, (uint64_t)sub_1006A544C);
}

+ (id)CRLCommandControllerDidRedo
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCDB0, &qword_10147F070, (uint64_t)sub_1006A548C);
}

+ (id)CRLCommandControllerDidExecuteUserCommand
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DCDB8, &qword_10147F078, (uint64_t)sub_1006A54CC);
}

+ (id)CRLiOSSceneDidBecomeActive
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD518, (id *)&qword_10147FF50, (uint64_t)sub_100902F24);
}

+ (id)CRLiOSSceneWillResignActive
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD520, (id *)&qword_10147FF58, (uint64_t)sub_100902F64);
}

+ (id)CRLiOSSceneWillEnterForeground
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD528, (id *)&qword_10147FF60, (uint64_t)sub_100902FA4);
}

+ (id)CRLiOSSceneDidEnterBackground
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD530, (id *)&qword_10147FF68, (uint64_t)sub_100902FE4);
}

+ (id)CRLiCloudDeviceToDeviceEncryptionAvailabilityChanged
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD578, &qword_10147FFD0, (uint64_t)sub_10094701C);
}

+ (id)CRLiCloudStatusChanged
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD580, &qword_10147FFD8, (uint64_t)sub_10094705C);
}

+ (id)CRLiCloudUserRecordIDChanged
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD588, &qword_10147FFE0, (uint64_t)sub_10094709C);
}

+ (id)CRLBoardDataStoreDidUpdateHierarchy
{
  if (qword_1013DDAD0 != -1)
    swift_once(&qword_1013DDAD0, sub_100A74384);
  return (id)qword_101480A78;
}

+ (id)CRLBoardRealTimeStateDidChange
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDB00, (id *)&qword_101480B10, (uint64_t)sub_100B1179C);
}

+ (id)CRLBoardRealTimeNewParticipantDidJoinSession
{
  return sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDB08, (id *)&qword_101480B18, (uint64_t)sub_100B117DC);
}

@end
