@implementation PNFreeformStoryDiagnosticsProvider

+ (id)memoryCreationDiagnosticFilesForMemory:(id)a3 error:(id *)a4
{
  return +[PNFreeformStoryDiagnosticsUtils diagnosticFilesFor:error:](PNFreeformStoryDiagnosticsUtils, "diagnosticFilesFor:error:", a3, a4);
}

@end
