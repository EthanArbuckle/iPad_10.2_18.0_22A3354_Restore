@implementation VMUAnalyzerBase

- (const)analyzerName
{
  return "Base - this should get overridden by subclasses";
}

+ (id)analyzerClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VMUAnalyzerBase)initWithGraph:(id)a3 regionIdentifier:(id)a4 debugTimer:(id)a5
{
  id v9;
  id v10;
  id v11;
  VMUAnalyzerBase *v12;
  VMUAnalyzerBase *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[VMUAnalyzerBase init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_regionIdentifier, a4);
    objc_storeStrong((id *)&v13->_debugTimer, a5);
  }

  return v13;
}

- (id)analysisSummaryWithError:(id *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
