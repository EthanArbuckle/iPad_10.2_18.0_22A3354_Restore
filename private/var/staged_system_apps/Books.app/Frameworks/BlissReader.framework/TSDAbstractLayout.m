@implementation TSDAbstractLayout

- (id)nextTargetFromLayout:(id)a3 column:(id)a4
{
  id v5;
  id result;

  v5 = objc_msgSend(-[TSDAbstractLayout navigableLayouts](self, "navigableLayouts", a3, a4), "tsu_objectAfterObjectIdenticalTo:", a3);
  if (!v5)
    return objc_msgSend(-[TSDAbstractLayout parent](self, "parent"), "nextTargetFromLayout:column:", self, 0);
  result = objc_msgSend(v5, "firstTarget");
  if (!result)
    return objc_msgSend(-[TSDAbstractLayout parent](self, "parent"), "nextTargetFromLayout:column:", self, 0);
  return result;
}

- (id)firstTarget
{
  return objc_msgSend(objc_msgSend(-[TSDAbstractLayout navigableLayouts](self, "navigableLayouts"), "firstObject"), "firstTarget");
}

- (id)previousTargetFromLayout:(id)a3 column:(id)a4
{
  id v5;
  id result;

  v5 = objc_msgSend(-[TSDAbstractLayout navigableLayouts](self, "navigableLayouts", a3, a4), "tsu_objectBeforeObjectIdenticalTo:", a3);
  if (!v5)
    return objc_msgSend(-[TSDAbstractLayout parent](self, "parent"), "previousTargetFromLayout:column:", self, 0);
  result = objc_msgSend(v5, "lastTarget");
  if (!result)
    return objc_msgSend(-[TSDAbstractLayout parent](self, "parent"), "previousTargetFromLayout:column:", self, 0);
  return result;
}

- (id)lastTarget
{
  return objc_msgSend(objc_msgSend(-[TSDAbstractLayout navigableLayouts](self, "navigableLayouts"), "lastObject"), "lastTarget");
}

@end
