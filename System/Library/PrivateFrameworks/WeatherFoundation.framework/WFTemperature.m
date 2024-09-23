@implementation WFTemperature

- (WFTemperature)initWithTemperatureUnit:(int)a3 value:(double)a4
{
  uint64_t v5;
  WFTemperature *v6;
  WFTemperature *v7;

  v5 = *(_QWORD *)&a3;
  v6 = -[WFTemperature init](self, "init");
  v7 = v6;
  if (v6)
    -[WFTemperature _setValue:forUnit:](v6, "_setValue:forUnit:", v5, a4);
  return v7;
}

- (WFTemperature)init
{
  WFTemperature *v2;
  WFTemperature *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTemperature;
  v2 = -[WFTemperature init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WFTemperature _resetTemperatureValues](v2, "_resetTemperatureValues");
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTemperature)initWithCoder:(id)a3
{
  id v4;
  WFTemperature *v5;
  WFTemperature *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFTemperature;
  v5 = -[WFTemperature init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = -[WFTemperature setKelvin:](v5, "setKelvin:", __31__WFTemperature_initWithCoder___block_invoke((uint64_t)v5, CFSTR("WFTemperatureKelvinKey"), v4));
    v8 = -[WFTemperature setFahrenheit:](v6, "setFahrenheit:", __31__WFTemperature_initWithCoder___block_invoke(v7, CFSTR("WFTemperatureFahrenheitKey"), v4));
    -[WFTemperature setCelsius:](v6, "setCelsius:", __31__WFTemperature_initWithCoder___block_invoke(v8, CFSTR("WFTemperatureCelsiusKey"), v4));
  }

  return v6;
}

double __31__WFTemperature_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "containsValueForKey:", v4))
  {
    objc_msgSend(v5, "decodeDoubleForKey:", v4);
    v7 = v6;
  }
  else
  {
    v7 = NAN;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFTemperatureKelvinKey"), self->_temperatureValues.kelvinVal);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFTemperatureFahrenheitKey"), self->_temperatureValues.fahrenheitVal);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFTemperatureCelsiusKey"), self->_temperatureValues.celsiusVal);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFTemperature kelvin](self, "kelvin");
  objc_msgSend(v4, "setKelvin:");
  -[WFTemperature celsius](self, "celsius");
  objc_msgSend(v4, "setCelsius:");
  -[WFTemperature fahrenheit](self, "fahrenheit");
  objc_msgSend(v4, "setFahrenheit:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFTemperature *v4;
  BOOL v5;

  v4 = (WFTemperature *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WFTemperature isEqualToTemperature:](self, "isEqualToTemperature:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFTemperature temperatureForUnit:](self, "temperatureForUnit:", 2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqualToTemperature:(id)a3
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "temperatureForUnit:", 2);
  v5 = v4;
  -[WFTemperature temperatureForUnit:](self, "temperatureForUnit:", 2);
  return vabdd_f64(v6, v5) < 2.22044605e-16;
}

- (double)kelvin
{
  double result;
  double v4;

  v4 = NAN;
  if (-[WFTemperature _unitIsHydrated:outputValue:](self, "_unitIsHydrated:outputValue:", 3, &v4))
    return v4;
  -[WFTemperature temperatureForUnit:](self, "temperatureForUnit:", 3);
  return result;
}

- (void)setKelvin:(double)a3
{
  -[WFTemperature _setValue:forUnit:](self, "_setValue:forUnit:", 3, a3);
}

- (double)celsius
{
  double result;
  double v4;

  v4 = NAN;
  if (-[WFTemperature _unitIsHydrated:outputValue:](self, "_unitIsHydrated:outputValue:", 2, &v4))
    return v4;
  -[WFTemperature temperatureForUnit:](self, "temperatureForUnit:", 2);
  return result;
}

- (void)setCelsius:(double)a3
{
  -[WFTemperature _setValue:forUnit:](self, "_setValue:forUnit:", 2, a3);
}

- (double)fahrenheit
{
  double result;
  double v4;

  v4 = NAN;
  if (-[WFTemperature _unitIsHydrated:outputValue:](self, "_unitIsHydrated:outputValue:", 1, &v4))
    return v4;
  -[WFTemperature temperatureForUnit:](self, "temperatureForUnit:", 1);
  return result;
}

- (void)setFahrenheit:(double)a3
{
  -[WFTemperature _setValue:forUnit:](self, "_setValue:forUnit:", 1, a3);
}

- (double)temperatureForUnit:(int)a3
{
  uint64_t v3;
  double v5;
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0x7FF8000000000000;
  if (-[WFTemperature _unitIsHydrated:outputValue:](self, "_unitIsHydrated:outputValue:", *(_QWORD *)&a3, &v16))
  {
    v5 = v14[3];
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndex:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addIndex:", 2);
    objc_msgSend(v6, "addIndex:", 1);
    objc_msgSend(v6, "removeIndex:", v3);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__WFTemperature_temperatureForUnit___block_invoke;
    v8[3] = &unk_24CCA2488;
    v8[4] = self;
    v8[5] = &v13;
    v8[6] = &v9;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);
    if (WFTemperatureUnitIsValid(*((_DWORD *)v10 + 6)))
    {
      v5 = WFConvertTemperature(*((_DWORD *)v10 + 6), v3, v14[3]);
      -[WFTemperature _setValue:forUnit:](self, "_setValue:forUnit:", v3);
    }
    else
    {
      v5 = NAN;
    }

    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __36__WFTemperature_temperatureForUnit___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v4;
  uint64_t result;

  v4 = a2;
  result = objc_msgSend(*(id *)(a1 + 32), "_unitIsHydrated:outputValue:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    *a3 = 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[WFTemperature celsius](self, "celsius");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[WFTemperature fahrenheit](self, "fahrenheit");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[WFTemperature kelvin](self, "kelvin");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, celsius = %@, fahrenheit = %@, kelvin = %@>"), v4, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setValue:(double)a3 forUnit:(int)a4
{
  if ((a4 - 1) <= 2)
    *(double *)((char *)&self->super.isa + qword_2118E5E20[a4 - 1]) = a3;
}

- (BOOL)_unitIsHydrated:(int)a3 outputValue:(double *)a4
{
  if ((a3 - 1) > 2)
    return 0;
  if (a4)
    *a4 = *(double *)((char *)&self->super.isa + qword_2118E5E20[a3 - 1]);
  return 1;
}

- (void)_resetTemperatureValues
{
  *(int64x2_t *)&self->_temperatureValues.celsiusVal = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_temperatureValues.fahrenheitVal = NAN;
}

@end
