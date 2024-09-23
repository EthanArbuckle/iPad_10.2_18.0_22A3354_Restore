@implementation PKPayLaterCardMagnitudes

- (PKPayLaterCardMagnitudes)initWithUnknownCount:(unint64_t)a3 foodAndDrinksCount:(unint64_t)a4 shoppingCount:(unint64_t)a5 travelCount:(unint64_t)a6 servicesCount:(unint64_t)a7 funCount:(unint64_t)a8 healthCount:(unint64_t)a9 transportCount:(unint64_t)a10
{
  PKPayLaterCardMagnitudes *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterCardMagnitudes;
  result = -[PKPayLaterCardMagnitudes init](&v17, sel_init);
  if (result)
  {
    result->_unknownCount = a3;
    result->_foodAndDrinksCount = a4;
    result->_shoppingCount = a5;
    result->_travelCount = a6;
    result->_servicesCount = a7;
    result->_funCount = a8;
    result->_healthCount = a9;
    result->_transportcount = a10;
  }
  return result;
}

- (PKPayLaterCardMagnitudes)initWithMaximumCount:(unint64_t)a3
{
  return -[PKPayLaterCardMagnitudes initWithUnknownCount:foodAndDrinksCount:shoppingCount:travelCount:servicesCount:funCount:healthCount:transportCount:](self, "initWithUnknownCount:foodAndDrinksCount:shoppingCount:travelCount:servicesCount:funCount:healthCount:transportCount:", 0, a3, a3, a3, a3, a3, a3, a3);
}

+ (id)emptyMangitudes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKPayLaterCardMagnitudes_emptyMangitudes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22908 != -1)
    dispatch_once(&qword_1ECF22908, block);
  return (id)_MergedGlobals_252;
}

void __43__PKPayLaterCardMagnitudes_emptyMangitudes__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_252;
  _MergedGlobals_252 = (uint64_t)v1;

}

+ (id)randomMagnitude
{
  _QWORD *v2;
  uint64_t i;
  uint32_t v4;

  v2 = objc_alloc_init((Class)a1);
  for (i = 0; ; ++i)
  {
    v4 = arc4random_uniform(0xDu);
    switch(i)
    {
      case 0:
        v2[1] = 0;
        break;
      case 1:
        v2[2] = v4;
        break;
      case 2:
        v2[3] = v4;
        break;
      case 3:
        v2[4] = v4;
        break;
      case 4:
        v2[5] = v4;
        break;
      case 5:
        v2[6] = v4;
        break;
      case 6:
        v2[7] = v4;
        break;
      case 7:
        v2[8] = v4;
        return v2;
      default:
        continue;
    }
  }
}

+ (id)fullMagnitude
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PKPayLaterCardMagnitudes_fullMagnitude__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22918 != -1)
    dispatch_once(&qword_1ECF22918, block);
  return (id)qword_1ECF22910;
}

void __41__PKPayLaterCardMagnitudes_fullMagnitude__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithMaximumCount:", 14);
  v2 = (void *)qword_1ECF22910;
  qword_1ECF22910 = v1;

}

+ (id)magnitudesFromFinancingPlans:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v24 = 0;
    v25 = 0;
    v22 = 0;
    v23 = 0;
    v20 = 0;
    v21 = 0;
    v19 = 0;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "state");
        if (v9 <= 4)
        {
          if (((1 << v9) & 0x13) != 0)
          {
            objc_msgSend(v8, "scheduleSummary");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "installments");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "pk_objectsPassingTest:", &__block_literal_global_152);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

          }
          else
          {
            objc_msgSend(v8, "planSummary");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "installmentCount");
          }

          if (v13)
          {
            objc_msgSend(v8, "merchant");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "merchantCategory");

            switch(v15)
            {
              case 0:
              case 2:
                v25 += v13;
                break;
              case 1:
                v24 += v13;
                break;
              case 3:
                v23 += v13;
                break;
              case 4:
                v22 += v13;
                break;
              case 5:
                v21 += v13;
                break;
              case 6:
                v20 += v13;
                break;
              case 7:
                v19 += v13;
                break;
              default:
                continue;
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v22 = 0;
    v23 = 0;
    v20 = 0;
    v21 = 0;
    v19 = 0;
  }
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnknownCount:foodAndDrinksCount:shoppingCount:travelCount:servicesCount:funCount:healthCount:transportCount:", 0, v24, v25, v23, v22, v21, v20, v19);

  return v16;
}

uint64_t __57__PKPayLaterCardMagnitudes_magnitudesFromFinancingPlans___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "status");
  return (v2 < 5) & (0x17u >> v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_unknownCount;
  *((_QWORD *)result + 2) = self->_foodAndDrinksCount;
  *((_QWORD *)result + 3) = self->_shoppingCount;
  *((_QWORD *)result + 4) = self->_travelCount;
  *((_QWORD *)result + 5) = self->_servicesCount;
  *((_QWORD *)result + 6) = self->_funCount;
  *((_QWORD *)result + 7) = self->_healthCount;
  *((_QWORD *)result + 8) = self->_transportcount;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterCardMagnitudes)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterCardMagnitudes *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterCardMagnitudes;
  v5 = -[PKPayLaterCardMagnitudes init](&v7, sel_init);
  if (v5)
  {
    v5->_unknownCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unknownCount"));
    v5->_foodAndDrinksCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("foodAndDrinksCount"));
    v5->_shoppingCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shoppingCount"));
    v5->_travelCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("travelCount"));
    v5->_servicesCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("servicesCount"));
    v5->_funCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("funCount"));
    v5->_healthCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("healthCount"));
    v5->_transportcount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transportCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t unknownCount;
  id v5;

  unknownCount = self->_unknownCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", unknownCount, CFSTR("unknownCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_foodAndDrinksCount, CFSTR("foodAndDrinksCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shoppingCount, CFSTR("shoppingCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_travelCount, CFSTR("travelCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_servicesCount, CFSTR("servicesCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_funCount, CFSTR("funCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_healthCount, CFSTR("healthCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transportcount, CFSTR("transportCount"));

}

- (unint64_t)unknownCount
{
  return self->_unknownCount;
}

- (void)setUnknownCount:(unint64_t)a3
{
  self->_unknownCount = a3;
}

- (unint64_t)foodAndDrinksCount
{
  return self->_foodAndDrinksCount;
}

- (void)setFoodAndDrinksCount:(unint64_t)a3
{
  self->_foodAndDrinksCount = a3;
}

- (unint64_t)shoppingCount
{
  return self->_shoppingCount;
}

- (void)setShoppingCount:(unint64_t)a3
{
  self->_shoppingCount = a3;
}

- (unint64_t)travelCount
{
  return self->_travelCount;
}

- (void)setTravelCount:(unint64_t)a3
{
  self->_travelCount = a3;
}

- (unint64_t)servicesCount
{
  return self->_servicesCount;
}

- (void)setServicesCount:(unint64_t)a3
{
  self->_servicesCount = a3;
}

- (unint64_t)funCount
{
  return self->_funCount;
}

- (void)setFunCount:(unint64_t)a3
{
  self->_funCount = a3;
}

- (unint64_t)healthCount
{
  return self->_healthCount;
}

- (void)setHealthCount:(unint64_t)a3
{
  self->_healthCount = a3;
}

- (unint64_t)transportcount
{
  return self->_transportcount;
}

- (void)setTransportcount:(unint64_t)a3
{
  self->_transportcount = a3;
}

@end
