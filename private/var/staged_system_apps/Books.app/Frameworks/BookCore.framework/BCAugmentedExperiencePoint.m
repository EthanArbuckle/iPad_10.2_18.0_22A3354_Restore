@implementation BCAugmentedExperiencePoint

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("BCAugmentedExperiencePoint\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperiencePoint experiencePoint](self, "experiencePoint"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        experiencePoint . . . : %@\n"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperiencePoint validRange](self, "validRange"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        validRange  . . . . . : %@"), v5);

  return v3;
}

- (BCBookPosition)experiencePoint
{
  return self->_experiencePoint;
}

- (void)setExperiencePoint:(id)a3
{
  objc_storeStrong((id *)&self->_experiencePoint, a3);
}

- (BCBookSection)validRange
{
  return self->_validRange;
}

- (void)setValidRange:(id)a3
{
  objc_storeStrong((id *)&self->_validRange, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRange, 0);
  objc_storeStrong((id *)&self->_experiencePoint, 0);
}

@end
