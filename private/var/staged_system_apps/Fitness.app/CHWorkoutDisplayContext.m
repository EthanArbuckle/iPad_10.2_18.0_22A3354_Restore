@implementation CHWorkoutDisplayContext

+ (id)displayContextWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DayViewDisplayContext")))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dayViewDisplayContext"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("WorkoutsListDisplayContext")))
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("FriendDetailDisplayContext")))
      {
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_friendDetailDisplayContext"));
        goto LABEL_11;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("WorkoutDetailDisplayContext")))
      {
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_workoutDetailDisplayContext"));
        goto LABEL_11;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("WorkoutDetailOpenGoalDisplayContext")))
      {
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_workoutDetailOpenGoalDisplayContext"));
        goto LABEL_11;
      }
    }
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_workoutsListDisplayContext"));
  }
LABEL_11:
  v6 = (void *)v5;

  return v6;
}

+ (id)_dayViewDisplayContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052094;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083DEA8 != -1)
    dispatch_once(&qword_10083DEA8, block);
  return (id)qword_10083DEA0;
}

+ (id)_workoutsListDisplayContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000522A0;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083DEB8 != -1)
    dispatch_once(&qword_10083DEB8, block);
  return (id)qword_10083DEB0;
}

+ (id)_friendDetailDisplayContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005263C;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083DEC8 != -1)
    dispatch_once(&qword_10083DEC8, block);
  return (id)qword_10083DEC0;
}

+ (BOOL)_screenIsLarge
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3 > 320.0;

  return v4;
}

+ (id)_workoutDetailDisplayContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000529D8;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083DED8 != -1)
    dispatch_once(&qword_10083DED8, block);
  return (id)qword_10083DED0;
}

+ (id)_workoutDetailOpenGoalDisplayContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052D2C;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083DEE8 != -1)
    dispatch_once(&qword_10083DEE8, block);
  return (id)qword_10083DEE0;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)ringThickness
{
  return self->_ringThickness;
}

- (void)setRingThickness:(double)a3
{
  self->_ringThickness = a3;
}

- (double)appIconWidth
{
  return self->_appIconWidth;
}

- (void)setAppIconWidth:(double)a3
{
  self->_appIconWidth = a3;
}

- (double)gymKitIconWidth
{
  return self->_gymKitIconWidth;
}

- (void)setGymKitIconWidth:(double)a3
{
  self->_gymKitIconWidth = a3;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

- (UIFont)goalDescriptionFont
{
  return self->_goalDescriptionFont;
}

- (void)setGoalDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_goalDescriptionFont, a3);
}

- (UIFont)pace100UnitFont
{
  return self->_pace100UnitFont;
}

- (void)setPace100UnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_pace100UnitFont, a3);
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (void)setDateFont:(id)a3
{
  objc_storeStrong((id *)&self->_dateFont, a3);
}

- (UIFont)workoutTypeFont
{
  return self->_workoutTypeFont;
}

- (void)setWorkoutTypeFont:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTypeFont, a3);
}

- (NSString)unitFormatString
{
  return self->_unitFormatString;
}

- (void)setUnitFormatString:(id)a3
{
  objc_storeStrong((id *)&self->_unitFormatString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitFormatString, 0);
  objc_storeStrong((id *)&self->_workoutTypeFont, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_pace100UnitFont, 0);
  objc_storeStrong((id *)&self->_goalDescriptionFont, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
}

@end
