@implementation FunctionalInterfaceUtils

+ (unsigned)nwFunctionalInterfaceTypeForNWInterface:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(v3, "subtype");

  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:](FunctionalInterfaceUtils, "nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:", v4, v5);
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3 nwInterfaceSubtype:(int64_t)a4
{
  return nw_interface_type_to_functional_type();
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceType:(int64_t)a3
{
  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:](FunctionalInterfaceUtils, "nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:", a3, 0);
}

+ (unsigned)nwFunctionalInterfaceTypeForNWInterfaceSubtype:(int64_t)a3
{
  return +[FunctionalInterfaceUtils nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:](FunctionalInterfaceUtils, "nwFunctionalInterfaceTypeForNWInterfaceType:nwInterfaceSubtype:", 0, a3);
}

+ (int64_t)nwInterfaceTypeForNWFunctionalInterfaceType:(unsigned __int8)a3
{
  return nw_interface_functional_type_to_interface_type();
}

+ (int64_t)nwInterfaceSubtypeForNWFunctionalInterfaceType:(unsigned __int8)a3
{
  return nw_interface_functional_type_to_interface_subtype();
}

+ (id)stringForFunctionalInterfaceType:(unsigned __int8)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("Other");
  else
    return off_251938BB8[(char)(a3 - 1)];
}

@end
