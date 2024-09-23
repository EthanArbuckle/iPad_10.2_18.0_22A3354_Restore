@implementation IDSDevice

- (id)cpDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice name](self, "name"));
  v4 = objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueID](self, "uniqueID"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("unknown ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice nsuuid](self, "nsuuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\" (%@), BT: (%@)"), v3, v6, v7));

  return v8;
}

- (id)deviceTypeToString
{
  id v2;

  v2 = -[IDSDevice deviceType](self, "deviceType");
  if ((unint64_t)v2 > 8)
    return CFSTR("NotDefined");
  else
    return (id)*((_QWORD *)&off_1001E52F8 + (_QWORD)v2);
}

@end
