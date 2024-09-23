@implementation KNAnimParameterSavedParameter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNAnimParameterSavedParameter)initWithCoder:(id)a3
{
  id v4;
  KNAnimParameterSavedParameter *v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *name;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  TSDBezierPath *pathValue;
  id v19;
  void *v20;
  NSString *v21;
  NSString *parameterDescription;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KNAnimParameterSavedParameter;
  v5 = -[KNAnimParameterSavedParameter init](&v24, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("nm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    name = v5->_name;
    v5->_name = v8;

    v5->_type = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tp"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dblValue"));
    v5->_doubleValue = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("max"));
    v5->_maxValue = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("min"));
    v5->_minValue = v12;
    v5->_hasMaxValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmax"));
    v5->_hasMinValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmin"));
    v13 = objc_opt_class(NSArray);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(KNAnimParameterGroupSavedPathElement), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("svdPth")));

    v17 = objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedParameter p_bezierPathFromSavedPathElements:](v5, "p_bezierPathFromSavedPathElements:", v16));
    pathValue = v5->_pathValue;
    v5->_pathValue = (TSDBezierPath *)v17;

    v5->_removed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removed"));
    v5->_debugOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dbg"));
    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("desc"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (NSString *)objc_msgSend(v20, "copy");
    parameterDescription = v5->_parameterDescription;
    v5->_parameterDescription = v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedParameter name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nm"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[KNAnimParameterSavedParameter type](self, "type"), CFSTR("tp"));
  -[KNAnimParameterSavedParameter doubleValue](self, "doubleValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("dblValue"));
  -[KNAnimParameterSavedParameter maxValue](self, "maxValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("max"));
  -[KNAnimParameterSavedParameter minValue](self, "minValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("min"));
  objc_msgSend(v4, "encodeBool:forKey:", -[KNAnimParameterSavedParameter hasMaxValue](self, "hasMaxValue"), CFSTR("hmax"));
  objc_msgSend(v4, "encodeBool:forKey:", -[KNAnimParameterSavedParameter hasMinValue](self, "hasMinValue"), CFSTR("hmin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedParameter pathValue](self, "pathValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedParameter p_savedPathFromPath:](self, "p_savedPathFromPath:", v6));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("svdPth"));

  objc_msgSend(v4, "encodeBool:forKey:", -[KNAnimParameterSavedParameter removed](self, "removed"), CFSTR("removed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[KNAnimParameterSavedParameter debugOnly](self, "debugOnly"), CFSTR("dbg"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedParameter parameterDescription](self, "parameterDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("desc"));

}

- (id)p_savedPathFromPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  KNAnimParameterGroupSavedPathElement *v7;
  KNAnimParameterGroupSavedPathElement *v8;
  uint64_t v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if ((uint64_t)objc_msgSend(v3, "elementCount") >= 1)
    {
      v5 = 0;
      do
      {
        v6 = objc_msgSend(v3, "elementAtIndex:associatedPoints:", v5, &v11);
        v7 = objc_alloc_init(KNAnimParameterGroupSavedPathElement);
        v8 = v7;
        switch((unint64_t)v6)
        {
          case 0uLL:
            v9 = 0;
            goto LABEL_7;
          case 1uLL:
            v9 = 1;
LABEL_7:
            -[KNAnimParameterGroupSavedPathElement setElementType:](v7, "setElementType:", v9);
            -[KNAnimParameterGroupSavedPathElement setToPoint:](v8, "setToPoint:", v11, v12);
            break;
          case 2uLL:
            -[KNAnimParameterGroupSavedPathElement setElementType:](v7, "setElementType:", 2);
            -[KNAnimParameterGroupSavedPathElement setToPoint:](v8, "setToPoint:", v15, v16);
            -[KNAnimParameterGroupSavedPathElement setCp1:](v8, "setCp1:", v11, v12);
            -[KNAnimParameterGroupSavedPathElement setCp2:](v8, "setCp2:", v13, v14);
            break;
          case 3uLL:
            -[KNAnimParameterGroupSavedPathElement setElementType:](v7, "setElementType:", 3);
            break;
          default:
            break;
        }
        objc_msgSend(v4, "addObject:", v8);

        ++v5;
      }
      while (v5 < (uint64_t)objc_msgSend(v3, "elementCount"));
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)p_bezierPathFromSavedPathElements:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)TSDBezierPath);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          switch((unint64_t)objc_msgSend(v10, "elementType", (_QWORD)v22))
          {
            case 0uLL:
              objc_msgSend(v10, "toPoint");
              objc_msgSend(v4, "moveToPoint:");
              break;
            case 1uLL:
              objc_msgSend(v10, "toPoint");
              objc_msgSend(v4, "lineToPoint:");
              break;
            case 2uLL:
              objc_msgSend(v10, "toPoint");
              v12 = v11;
              v14 = v13;
              objc_msgSend(v10, "cp1");
              v16 = v15;
              v18 = v17;
              objc_msgSend(v10, "cp2");
              objc_msgSend(v4, "curveToPoint:controlPoint1:controlPoint2:", v12, v14, v16, v18, v19, v20);
              break;
            case 3uLL:
              objc_msgSend(v4, "closePath");
              break;
            default:
              continue;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (TSDBezierPath)pathValue
{
  return self->_pathValue;
}

- (void)setPathValue:(id)a3
{
  objc_storeStrong((id *)&self->_pathValue, a3);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (BOOL)hasMaxValue
{
  return self->_hasMaxValue;
}

- (void)setHasMaxValue:(BOOL)a3
{
  self->_hasMaxValue = a3;
}

- (BOOL)hasMinValue
{
  return self->_hasMinValue;
}

- (void)setHasMinValue:(BOOL)a3
{
  self->_hasMinValue = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (BOOL)debugOnly
{
  return self->_debugOnly;
}

- (void)setDebugOnly:(BOOL)a3
{
  self->_debugOnly = a3;
}

- (NSString)parameterDescription
{
  return self->_parameterDescription;
}

- (void)setParameterDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDescription, 0);
  objc_storeStrong((id *)&self->_pathValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
