@implementation _REIntegerFeatureValue

- (unint64_t)type
{
  return 1;
}

- (unint64_t)int64Value
{
  return self->_value;
}

+ (id)featureValueWithInt64:(int64_t)a3
{
  void *v3;
  _REIntegerFeatureValue *v4;

  switch(a3)
  {
    case 0:
      if (featureValueWithInt64__onceToken != -1)
        dispatch_once(&featureValueWithInt64__onceToken, &__block_literal_global_67);
      v3 = (void *)featureValueWithInt64__Value;
      goto LABEL_102;
    case 1:
      if (featureValueWithInt64__onceToken_69 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_69, &__block_literal_global_70);
      v3 = (void *)featureValueWithInt64__Value_68;
      goto LABEL_102;
    case 2:
      if (featureValueWithInt64__onceToken_72 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_72, &__block_literal_global_73_1);
      v3 = (void *)featureValueWithInt64__Value_71;
      goto LABEL_102;
    case 3:
      if (featureValueWithInt64__onceToken_75 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_75, &__block_literal_global_76);
      v3 = (void *)featureValueWithInt64__Value_74;
      goto LABEL_102;
    case 4:
      if (featureValueWithInt64__onceToken_78 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_78, &__block_literal_global_79_2);
      v3 = (void *)featureValueWithInt64__Value_77;
      goto LABEL_102;
    case 5:
      if (featureValueWithInt64__onceToken_81 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_81, &__block_literal_global_82);
      v3 = (void *)featureValueWithInt64__Value_80;
      goto LABEL_102;
    case 6:
      if (featureValueWithInt64__onceToken_84 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_84, &__block_literal_global_85_0);
      v3 = (void *)featureValueWithInt64__Value_83;
      goto LABEL_102;
    case 7:
      if (featureValueWithInt64__onceToken_87 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_87, &__block_literal_global_88);
      v3 = (void *)featureValueWithInt64__Value_86;
      goto LABEL_102;
    case 8:
      if (featureValueWithInt64__onceToken_90 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_90, &__block_literal_global_91);
      v3 = (void *)featureValueWithInt64__Value_89;
      goto LABEL_102;
    case 9:
      if (featureValueWithInt64__onceToken_93 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_93, &__block_literal_global_94);
      v3 = (void *)featureValueWithInt64__Value_92;
      goto LABEL_102;
    case 10:
      if (featureValueWithInt64__onceToken_96 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_96, &__block_literal_global_97);
      v3 = (void *)featureValueWithInt64__Value_95;
      goto LABEL_102;
    case 11:
      if (featureValueWithInt64__onceToken_99 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_99, &__block_literal_global_100_0);
      v3 = (void *)featureValueWithInt64__Value_98;
      goto LABEL_102;
    case 12:
      if (featureValueWithInt64__onceToken_102 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_102, &__block_literal_global_103);
      v3 = (void *)featureValueWithInt64__Value_101;
      goto LABEL_102;
    case 13:
      if (featureValueWithInt64__onceToken_105 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_105, &__block_literal_global_106);
      v3 = (void *)featureValueWithInt64__Value_104;
      goto LABEL_102;
    case 14:
      if (featureValueWithInt64__onceToken_108 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_108, &__block_literal_global_109_0);
      v3 = (void *)featureValueWithInt64__Value_107;
      goto LABEL_102;
    case 15:
      if (featureValueWithInt64__onceToken_111 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_111, &__block_literal_global_112);
      v3 = (void *)featureValueWithInt64__Value_110;
      goto LABEL_102;
    case 16:
      if (featureValueWithInt64__onceToken_114 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_114, &__block_literal_global_115);
      v3 = (void *)featureValueWithInt64__Value_113;
      goto LABEL_102;
    case 17:
      if (featureValueWithInt64__onceToken_117 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_117, &__block_literal_global_118);
      v3 = (void *)featureValueWithInt64__Value_116;
      goto LABEL_102;
    case 18:
      if (featureValueWithInt64__onceToken_120 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_120, &__block_literal_global_121_0);
      v3 = (void *)featureValueWithInt64__Value_119;
      goto LABEL_102;
    case 19:
      if (featureValueWithInt64__onceToken_123 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_123, &__block_literal_global_124);
      v3 = (void *)featureValueWithInt64__Value_122;
      goto LABEL_102;
    case 20:
      if (featureValueWithInt64__onceToken_126 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_126, &__block_literal_global_127);
      v3 = (void *)featureValueWithInt64__Value_125;
      goto LABEL_102;
    case 21:
      if (featureValueWithInt64__onceToken_129 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_129, &__block_literal_global_130);
      v3 = (void *)featureValueWithInt64__Value_128;
      goto LABEL_102;
    case 22:
      if (featureValueWithInt64__onceToken_132 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_132, &__block_literal_global_133);
      v3 = (void *)featureValueWithInt64__Value_131;
      goto LABEL_102;
    case 23:
      if (featureValueWithInt64__onceToken_135 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_135, &__block_literal_global_136);
      v3 = (void *)featureValueWithInt64__Value_134;
      goto LABEL_102;
    case 24:
      if (featureValueWithInt64__onceToken_138 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_138, &__block_literal_global_139);
      v3 = (void *)featureValueWithInt64__Value_137;
      goto LABEL_102;
    case 25:
      if (featureValueWithInt64__onceToken_141 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_141, &__block_literal_global_142);
      v3 = (void *)featureValueWithInt64__Value_140;
      goto LABEL_102;
    case 26:
      if (featureValueWithInt64__onceToken_144 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_144, &__block_literal_global_145);
      v3 = (void *)featureValueWithInt64__Value_143;
      goto LABEL_102;
    case 27:
      if (featureValueWithInt64__onceToken_147 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_147, &__block_literal_global_148);
      v3 = (void *)featureValueWithInt64__Value_146;
      goto LABEL_102;
    case 28:
      if (featureValueWithInt64__onceToken_150 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_150, &__block_literal_global_151);
      v3 = (void *)featureValueWithInt64__Value_149;
      goto LABEL_102;
    case 29:
      if (featureValueWithInt64__onceToken_153 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_153, &__block_literal_global_154);
      v3 = (void *)featureValueWithInt64__Value_152;
      goto LABEL_102;
    case 30:
      if (featureValueWithInt64__onceToken_156 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_156, &__block_literal_global_157);
      v3 = (void *)featureValueWithInt64__Value_155;
      goto LABEL_102;
    case 31:
      if (featureValueWithInt64__onceToken_159 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_159, &__block_literal_global_160);
      v3 = (void *)featureValueWithInt64__Value_158;
      goto LABEL_102;
    case 32:
      if (featureValueWithInt64__onceToken_162 != -1)
        dispatch_once(&featureValueWithInt64__onceToken_162, &__block_literal_global_163);
      v3 = (void *)featureValueWithInt64__Value_161;
LABEL_102:
      v4 = v3;
      break;
    default:
      v4 = -[_REIntegerFeatureValue initWithValue:]([_REIntegerFeatureValue alloc], "initWithValue:", a3);
      break;
  }
  return v4;
}

- (_REIntegerFeatureValue)initWithValue:(int64_t)a3
{
  _REIntegerFeatureValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REIntegerFeatureValue;
  result = -[_REIntegerFeatureValue init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (unint64_t)hash
{
  return self->_value;
}

- (unint64_t)_integralFeatureValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  _REIntegerFeatureValue *v4;
  BOOL v5;

  v4 = (_REIntegerFeatureValue *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4->_value;
  }

  return v5;
}

@end
