@implementation OITSUFakeProgress

- (OITSUFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4
{
  uint64_t v7;
  OITSUFakeProgress *v8;
  objc_super v10;

  if (!a4)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFakeProgress initWithMaxValue:numberOfStages:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUProgress.m"), 651, 0, "Invalid parameter not satisfying: %{public}s", "numberOfStages > 0");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v10.receiver = self;
  v10.super_class = (Class)OITSUFakeProgress;
  v8 = -[OITSUBasicProgress initWithMaxValue:](&v10, sel_initWithMaxValue_, a3);
  if (v8)
  {
    v8->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("TSUFakeProgress", 0);
    v8->_numberOfStages = a4;
    v8->_stopped = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUFakeProgress;
  -[OITSUBasicProgress dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__OITSUFakeProgress_start__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __26__OITSUFakeProgress_start__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 64))
  {
    *(_BYTE *)(v1 + 64) = 0;
    return objc_msgSend(*(id *)(result + 32), "p_slowlyAdvanceToNextStage");
  }
  return result;
}

- (void)stop
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__OITSUFakeProgress_stop__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __25__OITSUFakeProgress_stop__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 1;
  return result;
}

- (void)advanceToStage:(unint64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__OITSUFakeProgress_advanceToStage___block_invoke;
  v4[3] = &unk_24F39B188;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __36__OITSUFakeProgress_advanceToStage___block_invoke(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  double v5;
  double v6;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 > *(_QWORD *)(v2 + 48) && v1 <= *(_QWORD *)(v2 + 56))
  {
    v3 = result;
    *(_QWORD *)(v2 + 48) = v1;
    v4 = *(unint64_t **)(result + 32);
    v5 = (double)v4[6] / (double)v4[7];
    objc_msgSend(v4, "maxValue");
    return objc_msgSend(*(id *)(v3 + 32), "setValue:", v6 * v5);
  }
  return result;
}

- (void)p_slowlyAdvanceToNextStage
{
  dispatch_time_t v3;
  NSObject *accessQueue;
  _QWORD block[5];

  if (!self->_stopped && self->_currentStage < self->_numberOfStages)
  {
    v3 = dispatch_time(0, 250000000);
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__OITSUFakeProgress_p_slowlyAdvanceToNextStage__block_invoke;
    block[3] = &unk_24F39A608;
    block[4] = self;
    dispatch_after(v3, accessQueue, block);
  }
}

uint64_t __47__OITSUFakeProgress_p_slowlyAdvanceToNextStage__block_invoke(uint64_t a1)
{
  unint64_t *v2;
  double v3;
  double v4;
  unint64_t *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = *(unint64_t **)(a1 + 32);
  v3 = 1.0;
  v4 = 1.0 / (double)v2[7];
  objc_msgSend(v2, "value");
  v5 = *(unint64_t **)(a1 + 32);
  v6 = (double)v5[6];
  v8 = 1.0 - (1.0 - (v7 - v6 * v4) / v4) * 0.95;
  if (v8 > 0.95)
    v8 = 0.95;
  v9 = v4 * (v8 + v6);
  if (v9 <= 1.0)
    v3 = v9;
  objc_msgSend(v5, "maxValue");
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v10 * v3);
  return objc_msgSend(*(id *)(a1 + 32), "p_slowlyAdvanceToNextStage");
}

@end
