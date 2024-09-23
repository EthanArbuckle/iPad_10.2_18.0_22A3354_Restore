@implementation PLQLDuetInMemoryCache

- (PLQLDuetInMemoryCache)init
{
  PLQLDuetInMemoryCache *v2;
  PLQLDuetInMemoryCache *v3;
  NSDictionary *startArgs;
  NSDictionary *stopArgs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLQLDuetInMemoryCache;
  v2 = -[PLQLDuetInMemoryCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    startArgs = v2->_startArgs;
    v2->_startArgs = 0;

    stopArgs = v3->_stopArgs;
    v3->_stopArgs = 0;

    v3->_refCount = 0;
    *(_OWORD *)&v3->_startTime = 0u;
    *(_OWORD *)&v3->_cellIn = 0u;
    *(_OWORD *)&v3->_wifiIn = 0u;
  }
  return v3;
}

- (PLQLDuetInMemoryCache)initWithStartTime:(double)a3 withStartargs:(id)a4
{
  id v7;
  PLQLDuetInMemoryCache *v8;
  PLQLDuetInMemoryCache *v9;
  NSDictionary *stopArgs;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLQLDuetInMemoryCache;
  v8 = -[PLQLDuetInMemoryCache init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startArgs, a4);
    stopArgs = v9->_stopArgs;
    v9->_stopArgs = 0;

    v9->_startTime = a3;
    v9->_refCount = 0;
    *(_OWORD *)&v9->_stopTime = 0u;
    *(_OWORD *)&v9->_cellOut = 0u;
    v9->_wifiOut = 0.0;
  }

  return v9;
}

- (void)clearStop
{
  -[PLQLDuetInMemoryCache setStopTime:](self, "setStopTime:", 0.0);
  -[PLQLDuetInMemoryCache setStopArgs:](self, "setStopArgs:", 0);
}

- (BOOL)isStartPresent
{
  double v2;

  -[PLQLDuetInMemoryCache startTime](self, "startTime");
  return v2 != 0.0;
}

- (BOOL)isStopPresent
{
  double v2;

  -[PLQLDuetInMemoryCache stopTime](self, "stopTime");
  return v2 != 0.0;
}

- (void)addDataWithCellIn:(double)a3 withCellOut:(double)a4 withWifiIn:(double)a5 withWifiOut:(double)a6
{
  double v11;
  double v12;
  double v13;
  double v14;

  -[PLQLDuetInMemoryCache cellIn](self, "cellIn");
  -[PLQLDuetInMemoryCache setCellIn:](self, "setCellIn:", v11 + a3);
  -[PLQLDuetInMemoryCache cellOut](self, "cellOut");
  -[PLQLDuetInMemoryCache setCellOut:](self, "setCellOut:", v12 + a4);
  -[PLQLDuetInMemoryCache wifiIn](self, "wifiIn");
  -[PLQLDuetInMemoryCache setWifiIn:](self, "setWifiIn:", v13 + a5);
  -[PLQLDuetInMemoryCache wifiOut](self, "wifiOut");
  -[PLQLDuetInMemoryCache setWifiOut:](self, "setWifiOut:", v14 + a6);
}

- (void)addStartEvent:(double)a3 withArgs:(id)a4
{
  id v6;

  v6 = a4;
  -[PLQLDuetInMemoryCache setStartTime:](self, "setStartTime:", a3);
  -[PLQLDuetInMemoryCache setStartArgs:](self, "setStartArgs:", v6);
  -[PLQLDuetInMemoryCache updateDataStats:](self, "updateDataStats:", v6);

}

- (void)addStopEvent:(double)a3 withArgs:(id)a4
{
  id v6;

  v6 = a4;
  -[PLQLDuetInMemoryCache setStopTime:](self, "setStopTime:", a3);
  -[PLQLDuetInMemoryCache setStopArgs:](self, "setStopArgs:", v6);
  -[PLQLDuetInMemoryCache updateDataStats:](self, "updateDataStats:", v6);

}

- (void)updateDataStats:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  double v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cellin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  -[PLQLDuetInMemoryCache cellIn](self, "cellIn");
  -[PLQLDuetInMemoryCache setCellIn:](self, "setCellIn:", v8 + v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cellout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  -[PLQLDuetInMemoryCache cellOut](self, "cellOut");
  -[PLQLDuetInMemoryCache setCellOut:](self, "setCellOut:", v12 + v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifiin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;
  -[PLQLDuetInMemoryCache wifiIn](self, "wifiIn");
  -[PLQLDuetInMemoryCache setWifiIn:](self, "setWifiIn:", v16 + v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifiout"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "floatValue");
  v18 = v17;
  -[PLQLDuetInMemoryCache wifiOut](self, "wifiOut");
  -[PLQLDuetInMemoryCache setWifiOut:](self, "setWifiOut:", v19 + v18);

}

- (NSDictionary)startArgs
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartArgs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)stopArgs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStopArgs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (double)cellIn
{
  return self->_cellIn;
}

- (void)setCellIn:(double)a3
{
  self->_cellIn = a3;
}

- (double)cellOut
{
  return self->_cellOut;
}

- (void)setCellOut:(double)a3
{
  self->_cellOut = a3;
}

- (double)wifiIn
{
  return self->_wifiIn;
}

- (void)setWifiIn:(double)a3
{
  self->_wifiIn = a3;
}

- (double)wifiOut
{
  return self->_wifiOut;
}

- (void)setWifiOut:(double)a3
{
  self->_wifiOut = a3;
}

- (int)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(int)a3
{
  self->_refCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopArgs, 0);
  objc_storeStrong((id *)&self->_startArgs, 0);
}

@end
