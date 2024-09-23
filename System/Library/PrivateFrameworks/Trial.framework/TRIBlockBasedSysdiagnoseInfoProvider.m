@implementation TRIBlockBasedSysdiagnoseInfoProvider

- (TRIBlockBasedSysdiagnoseInfoProvider)initWithOutputFilename:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  TRIBlockBasedSysdiagnoseInfoProvider *v9;
  uint64_t v10;
  id block;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRIBlockBasedSysdiagnoseInfoProvider;
  v9 = -[TRIBlockBasedSysdiagnoseInfoProvider init](&v13, sel_init);
  if (v9)
  {
    v10 = MEMORY[0x1A1AC6D30](v8);
    block = v9->_block;
    v9->_block = (id)v10;

    objc_storeStrong((id *)&v9->_outputFilename, a3);
  }

  return v9;
}

- (id)sysdiagnoseLinesWithError:(id *)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  -[TRIBlockBasedSysdiagnoseInfoProvider block](self, "block");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id *))v4)[2](v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)block
{
  return self->_block;
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
