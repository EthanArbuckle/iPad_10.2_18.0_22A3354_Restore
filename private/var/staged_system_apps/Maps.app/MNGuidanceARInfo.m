@implementation MNGuidanceARInfo

- (BOOL)isArrival
{
  unsigned int v2;
  BOOL result;

  v2 = -[MNGuidanceARInfo maneuverType](self, "maneuverType");
  result = 1;
  switch(v2)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xCu:
    case 0x11u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x23u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (id)_mapsDescriptionWithInstructionString:(id)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[MNGuidanceARInfo stepIndex](self, "stepIndex");
  v9 = -[MNGuidanceARInfo eventType](self, "eventType");
  if (v9 >= 3)
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v9));
  else
    v10 = off_1011B3758[(int)v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo arrowLabel](self, "arrowLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo maneuverRoadName](self, "maneuverRoadName"));
  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v14 = v13;
  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v16 = v15;
  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, step index: %lu, type: %@, instruction: %@, arrow label: %@, maneuver road name: %@, coordinate: {%f, %f, %f}>"), v7, self, v8, v10, v4, v11, v12, v14, v16, v17));

  return v18;
}

- (NSString)mapsShortDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo instructionString](self, "instructionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringWithOptions:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo _mapsDescriptionWithInstructionString:](self, "_mapsDescriptionWithInstructionString:", v4));

  return (NSString *)v5;
}

- (NSString)mapsLongDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo instructionString](self, "instructionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo _mapsDescriptionWithInstructionString:](self, "_mapsDescriptionWithInstructionString:", v4));

  return (NSString *)v5;
}

@end
