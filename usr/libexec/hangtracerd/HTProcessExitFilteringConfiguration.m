@implementation HTProcessExitFilteringConfiguration

+ (id)configurationAllowingAllProcesses:(BOOL)a3 criticalProcesses:(BOOL)a4 processNames:(id)a5 reasons:(unint64_t)a6 subReasons:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  HTProcessExitFilteringConfiguration *v13;
  void *v14;

  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = a5;
  v13 = objc_alloc_init(HTProcessExitFilteringConfiguration);
  -[HTProcessExitFilteringConfiguration setAllowsAllProcesses:](v13, "setAllowsAllProcesses:", v10);
  -[HTProcessExitFilteringConfiguration setAllowsCriticalProcesses:](v13, "setAllowsCriticalProcesses:", v9);
  if (v12)
    v14 = v12;
  else
    v14 = &__NSArray0__struct;
  -[HTProcessExitFilteringConfiguration setAllowedProcessNames:](v13, "setAllowedProcessNames:", v14);

  -[HTProcessExitFilteringConfiguration setAllowedReasons:](v13, "setAllowedReasons:", a6);
  -[HTProcessExitFilteringConfiguration setAllowedSubReasons:](v13, "setAllowedSubReasons:", v11);

  return v13;
}

+ (id)configurationFromPrefs:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "areAllProcessTerminationsMonitored");
  v5 = objc_msgSend(v3, "areCriticalProcessTerminationsMonitored");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processTerminationNamesMonitored"));
  v7 = objc_msgSend(v3, "processTerminationReasonsMonitored");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processTerminationSubReasonsMonitored"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessExitFilteringConfiguration configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:](HTProcessExitFilteringConfiguration, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:", v4, v5, v6, v7, v8));
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTProcessExitFilteringConfiguration)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  HTProcessExitFilteringConfiguration *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsAllProcesses"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsCriticalProcesses"));
  v7 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("allowedProcessNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("allowedReasons"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_opt_class(NSNumber);
  v12 = objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v11, objc_opt_class(NSNumber), CFSTR("allowedSubReasons"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (HTProcessExitFilteringConfiguration *)objc_claimAutoreleasedReturnValue(+[HTProcessExitFilteringConfiguration configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:](HTProcessExitFilteringConfiguration, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:", v5, v6, v8, objc_msgSend(v10, "unsignedLongLongValue"), v13));
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 allowsAllProcesses;
  void *v5;
  id v6;

  allowsAllProcesses = self->_allowsAllProcesses;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", allowsAllProcesses, CFSTR("allowsAllProcesses"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allowsCriticalProcesses, CFSTR("allowsCriticalProcesses"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_allowedProcessNames, CFSTR("allowedProcessNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_allowedReasons));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("allowedReasons"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_allowedSubReasons, CFSTR("allowedSubReasons"));
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_allowsAllProcesses)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_allowsCriticalProcesses)
    v2 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("all processes:      %@\ncritical processes: %@\nprocess names:      %@\nreasons:            %llu\nsub-reasons:        %@"), v3, v2, self->_allowedProcessNames, self->_allowedReasons, self->_allowedSubReasons);
}

- (BOOL)isEqual:(id)a3
{
  HTProcessExitFilteringConfiguration *v4;
  uint64_t v5;
  HTProcessExitFilteringConfiguration *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = (HTProcessExitFilteringConfiguration *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[HTProcessExitFilteringConfiguration allowsAllProcesses](self, "allowsAllProcesses");
      if (v7 == -[HTProcessExitFilteringConfiguration allowsAllProcesses](v6, "allowsAllProcesses")
        && (v8 = -[HTProcessExitFilteringConfiguration allowsCriticalProcesses](self, "allowsCriticalProcesses"),
            v8 == -[HTProcessExitFilteringConfiguration allowsCriticalProcesses](v6, "allowsCriticalProcesses")))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessExitFilteringConfiguration allowedProcessNames](self, "allowedProcessNames"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessExitFilteringConfiguration allowedProcessNames](v6, "allowedProcessNames"));
        if (objc_msgSend(v10, "isEqual:", v11)
          && (v12 = -[HTProcessExitFilteringConfiguration allowedReasons](self, "allowedReasons"),
              v12 == (id)-[HTProcessExitFilteringConfiguration allowedReasons](v6, "allowedReasons")))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessExitFilteringConfiguration allowedSubReasons](self, "allowedSubReasons"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessExitFilteringConfiguration allowedSubReasons](v6, "allowedSubReasons"));
          v9 = objc_msgSend(v13, "isEqual:", v14);

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSDictionary *allowedSubReasons;
  unint64_t v6;

  v3 = self->_allowsCriticalProcesses ^ self->_allowsAllProcesses;
  v4 = (unint64_t)-[NSArray hash](self->_allowedProcessNames, "hash");
  allowedSubReasons = self->_allowedSubReasons;
  v6 = v4 ^ self->_allowedReasons ^ v3;
  return v6 ^ (unint64_t)-[NSDictionary hash](allowedSubReasons, "hash");
}

- (BOOL)allowsAllProcesses
{
  return self->_allowsAllProcesses;
}

- (void)setAllowsAllProcesses:(BOOL)a3
{
  self->_allowsAllProcesses = a3;
}

- (BOOL)allowsCriticalProcesses
{
  return self->_allowsCriticalProcesses;
}

- (void)setAllowsCriticalProcesses:(BOOL)a3
{
  self->_allowsCriticalProcesses = a3;
}

- (NSArray)allowedProcessNames
{
  return self->_allowedProcessNames;
}

- (void)setAllowedProcessNames:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProcessNames, a3);
}

- (unint64_t)allowedReasons
{
  return self->_allowedReasons;
}

- (void)setAllowedReasons:(unint64_t)a3
{
  self->_allowedReasons = a3;
}

- (NSDictionary)allowedSubReasons
{
  return self->_allowedSubReasons;
}

- (void)setAllowedSubReasons:(id)a3
{
  objc_storeStrong((id *)&self->_allowedSubReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSubReasons, 0);
  objc_storeStrong((id *)&self->_allowedProcessNames, 0);
}

@end
