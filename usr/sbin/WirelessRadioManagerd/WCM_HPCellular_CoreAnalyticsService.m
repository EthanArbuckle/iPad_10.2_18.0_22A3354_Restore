@implementation WCM_HPCellular_CoreAnalyticsService

+ (id)singleton
{
  id result;
  objc_super v4;

  result = (id)qword_1002711F8;
  if (!qword_1002711F8)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_HPCellular_CoreAnalyticsService;
    result = objc_msgSend(objc_msgSendSuper2(&v4, "allocWithZone:", 0), "init");
    qword_1002711F8 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "singleton", a3);
}

- (WCM_HPCellular_CoreAnalyticsService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_HPCellular_CoreAnalyticsService;
  return -[WCM_HPCellular_CoreAnalyticsService init](&v3, "init");
}

- (void)resetHPCellularCoexStatsMetrics
{
  *(_OWORD *)&self->_leaMaxDeviceCount = 0u;
  *(_OWORD *)&self->_hidMaxDeviceCount = 0u;
  *(_OWORD *)&self->_escoMaxDeviceCount = 0u;
  *(_OWORD *)&self->_btMaxDeviceCount = 0u;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA: Reset HPCellularCoexStat"));
}

- (void)updateHPCellularCoexStatsWithBtDeviceCount:(unint64_t)a3 a2dpDeviceCount:(unint64_t)a4 escoDeviceCount:(unint64_t)a5 scoDeviceCount:(unint64_t)a6 hidDeviceCount:(unint64_t)a7 leDeviceCount:(unint64_t)a8 leaDeviceCount:(unint64_t)a9 llaDeviceCount:(unint64_t)a10
{
  unint64_t v10;
  unint64_t leaMaxDeviceCount;
  unint64_t btMaxDeviceCount;
  unint64_t a2dpMaxDeviceCount;
  unint64_t escoMaxDeviceCount;
  unint64_t scoMaxDeviceCount;
  unint64_t hidMaxDeviceCount;
  unint64_t leMaxDeviceCount;
  unint64_t llaMaxDeviceCount;

  leaMaxDeviceCount = a9;
  v10 = a10;
  btMaxDeviceCount = self->_btMaxDeviceCount;
  a2dpMaxDeviceCount = self->_a2dpMaxDeviceCount;
  if (btMaxDeviceCount <= a3)
    btMaxDeviceCount = a3;
  if (a2dpMaxDeviceCount <= a4)
    a2dpMaxDeviceCount = a4;
  escoMaxDeviceCount = self->_escoMaxDeviceCount;
  scoMaxDeviceCount = self->_scoMaxDeviceCount;
  if (escoMaxDeviceCount <= a5)
    escoMaxDeviceCount = a5;
  if (scoMaxDeviceCount <= a6)
    scoMaxDeviceCount = a6;
  hidMaxDeviceCount = self->_hidMaxDeviceCount;
  leMaxDeviceCount = self->_leMaxDeviceCount;
  if (hidMaxDeviceCount <= a7)
    hidMaxDeviceCount = a7;
  if (leMaxDeviceCount <= a8)
    leMaxDeviceCount = a8;
  llaMaxDeviceCount = self->_llaMaxDeviceCount;
  if (self->_leaMaxDeviceCount > a9)
    leaMaxDeviceCount = self->_leaMaxDeviceCount;
  self->_btMaxDeviceCount = btMaxDeviceCount;
  self->_a2dpMaxDeviceCount = a2dpMaxDeviceCount;
  self->_escoMaxDeviceCount = escoMaxDeviceCount;
  self->_scoMaxDeviceCount = scoMaxDeviceCount;
  self->_hidMaxDeviceCount = hidMaxDeviceCount;
  self->_leMaxDeviceCount = leMaxDeviceCount;
  if (llaMaxDeviceCount > a10)
    v10 = llaMaxDeviceCount;
  self->_leaMaxDeviceCount = leaMaxDeviceCount;
  self->_llaMaxDeviceCount = v10;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA (updateHPCellularCoexStatsWithBtDeviceCount): [btMaxDeviceCount = %d, a2dpMaxDeviceCount = %d, escoMaxDeviceCount = %d, scoMaxDeviceCount = %d, hidMaxDeviceCount = %d, leMaxDeviceCount = %d, leaMaxDeviceCount = %d, llaMaxDeviceCount = %d]"), btMaxDeviceCount, a2dpMaxDeviceCount, escoMaxDeviceCount, scoMaxDeviceCount, hidMaxDeviceCount, leMaxDeviceCount, leaMaxDeviceCount, v10);
}

- (void)submitHPCellularCoexStats
{
  _QWORD v3[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA (submitHPCellularCoexStats): Send HPCellular CA event: [btMaxDeviceCount = %d, a2dpMaxDeviceCount = %d, escoMaxDeviceCount = %d, scoMaxDeviceCount = %d, hidMaxDeviceCount = %d, leMaxDeviceCount = %d, leaMaxDeviceCount = %d, llaMaxDeviceCount = %d]"), self->_btMaxDeviceCount, self->_a2dpMaxDeviceCount, self->_escoMaxDeviceCount, self->_scoMaxDeviceCount, self->_hidMaxDeviceCount, self->_leMaxDeviceCount, self->_leaMaxDeviceCount, self->_llaMaxDeviceCount);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100096C74;
  v3[3] = &unk_100203A30;
  v3[4] = self;
  AnalyticsSendEventLazy(CFSTR("com.apple.StewieCoexStats"), v3);
}

- (unint64_t)btMaxDeviceCount
{
  return self->_btMaxDeviceCount;
}

- (unint64_t)a2dpMaxDeviceCount
{
  return self->_a2dpMaxDeviceCount;
}

- (unint64_t)escoMaxDeviceCount
{
  return self->_escoMaxDeviceCount;
}

- (unint64_t)scoMaxDeviceCount
{
  return self->_scoMaxDeviceCount;
}

- (unint64_t)hidMaxDeviceCount
{
  return self->_hidMaxDeviceCount;
}

- (unint64_t)leMaxDeviceCount
{
  return self->_leMaxDeviceCount;
}

- (unint64_t)leaMaxDeviceCount
{
  return self->_leaMaxDeviceCount;
}

- (unint64_t)llaMaxDeviceCount
{
  return self->_llaMaxDeviceCount;
}

@end
