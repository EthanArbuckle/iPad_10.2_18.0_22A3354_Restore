@implementation PXCuratedLibraryConcreteAnalysisStatus

void __66___PXCuratedLibraryConcreteAnalysisStatus__updateStatusProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v6, "setState:", v3);
  objc_msgSend(v6, "setLocalizedTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setLocalizedDescription:", *(_QWORD *)(a1 + 40));
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v6, "setProgress:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v6, "setDisplayProgress:", v5);
  objc_msgSend(v6, "setIsDaysMonthsYearsStructureEnabled:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v6, "setIsDevicePlugged:", *(_BYTE *)(a1 + 65) == 0);

}

uint64_t __70___PXCuratedLibraryConcreteAnalysisStatus__configureBatteryMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBatteryMonitoringEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__batteryStateDidChange_, *MEMORY[0x1E0DC4958], 0);

  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusProperties");
}

uint64_t __66___PXCuratedLibraryConcreteAnalysisStatus__batteryStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusProperties");
}

@end
