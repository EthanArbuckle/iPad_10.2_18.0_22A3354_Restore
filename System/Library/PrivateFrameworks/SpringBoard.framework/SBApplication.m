@implementation SBApplication

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isWebApplication
{
  return 0;
}

- (BOOL)isCacheCleaningTerminationAssertionHeld
{
  return 0;
}

- (BOOL)iconCanTruncateLabel:(id)a3
{
  return 1;
}

- (BOOL)iconCanTightenLabel:(id)a3
{
  return 1;
}

- (SBApplicationProcessState)_internalProcessState
{
  return (SBApplicationProcessState *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)_classicAppScaledPhoneOnPad
{
  _BOOL4 v3;
  void *v4;

  if (!-[SBApplication isClassic](self, "isClassic"))
    goto LABEL_5;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      return !-[SBApplication _classicAppScaledPadOnPad](self, "_classicAppScaledPadOnPad");
LABEL_5:
    LOBYTE(v3) = 0;
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
    v3 = !-[SBApplication _classicAppScaledPadOnPad](self, "_classicAppScaledPadOnPad");
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)isMedusaCapable
{
  _BOOL4 v3;
  BOOL v4;

  if (!-[SBApplicationInfo wantsFullScreen](self->_appInfo, "wantsFullScreen")
    || (v3 = -[SBApplication isClassic](self, "isClassic")))
  {
    if (self->_calculatedSupportedTypes)
    {
      v4 = -[SBApplication isClassic](self, "isClassic");
LABEL_5:
      LOBYTE(v3) = !v4;
      return v3;
    }
    v3 = -[SBApplicationInfo usesSplashBoard](self->_appInfo, "usesSplashBoard");
    if (v3)
    {
      v3 = -[SBApplicationInfo isMonarchLinked](self->_appInfo, "isMonarchLinked");
      if (v3)
      {
        v4 = -[SBApplication _isClassicViaOverride](self, "_isClassicViaOverride");
        goto LABEL_5;
      }
    }
  }
  return v3;
}

- (BOOL)isClassic
{
  return (unint64_t)(-[SBApplication _classicMode](self, "_classicMode") - 1) < 0xFFFFFFFFFFFFFFFELL;
}

- (int64_t)_classicMode
{
  if (self->_currentClassicMode == -1)
    return -[SBApplication _defaultClassicMode](self, "_defaultClassicMode");
  else
    return self->_currentClassicMode;
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  void *v3;
  char v4;

  -[SBApplication info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlockedForScreenTimeExpiration");

  return v4;
}

- (SBApplicationInfo)info
{
  SBApplication *v2;
  SBApplicationInfo *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_appInfo;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)_defaultClassicMode
{
  int64_t result;

  result = self->_defaultClassicModeOverride;
  if (result == -1)
  {
    -[SBApplication _calculateSupportedTypesLazilyIfNecessary](self, "_calculateSupportedTypesLazilyIfNecessary");
    result = -[SBApplication _classicModeFromSupportedTypes](self, "_classicModeFromSupportedTypes");
    if (result == -1)
      return 0;
  }
  return result;
}

- (void)_calculateSupportedTypesLazilyIfNecessary
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  double *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  char v11;
  _BOOL4 v12;
  double v13;
  int v14;
  char v15;
  _BOOL4 v16;
  double v17;
  int v18;
  char v19;
  _BOOL4 v20;
  double v21;
  int v22;
  char v23;
  int v24;
  char v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  unint64_t supportedTypes;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  char v37;
  int v38;
  int v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  int v45;
  char v46;
  int v47;
  double v48;
  uint64_t v49;
  int v50;
  double *v51;
  int v52;
  int v53;
  int v54;
  int v55;
  char v56;
  int v57;
  char v58;
  double v59;
  double v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  char v66;
  _BOOL4 v67;
  int v68;
  char v69;
  double v70;
  double v71;
  void *v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  char v78;
  int v79;
  char v80;
  double v81;
  double v82;
  double *v83;
  int v84;
  uint64_t v85;
  int v86;
  int v87;
  int v88;
  char v89;
  _BOOL4 v90;
  int v91;
  char v92;
  double v93;
  double v94;
  double *v95;
  int v96;
  char v97;
  _BOOL4 v98;
  int v99;
  char v100;
  double v101;
  double *v102;
  int v103;
  char v104;
  double v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  double *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  double *v120;
  _BOOL4 v121;
  _BOOL4 v122;
  double *v123;
  void *v124;
  _BOOL4 v125;
  _BOOL4 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (self->_calculatedSupportedTypes)
    return;
  if (-[SBApplication _bypassesClassicMode]((uint64_t)self))
  {
    self->_supportedTypes |= 0xFFFFFFFFFFFF3FFFLL;
    goto LABEL_332;
  }
  v5 = 168;
  if (-[SBApplicationInfo usesSplashBoard](self->_appInfo, "usesSplashBoard"))
  {
    -[SBApplication _calculateSupportedTypesForSplashBoard](self, "_calculateSupportedTypesForSplashBoard");
    goto LABEL_332;
  }
  v6 = (double *)MGCopyAnswer();
  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setContentTypeMask:", 4);
  objc_msgSend((id)v8, "setRequiredOSVersion:", v6);
  objc_msgSend(v7, "defaultGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)v8;
  v116 = v7;
  objc_msgSend(v7, "snapshotsForGroupID:matchingPredicate:", v9, v8);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2))
    goto LABEL_86;
  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
LABEL_18:

      goto LABEL_19;
    }
  }
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v12 = v13 >= *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v2 & 1) == 0)

  if ((v11 & 1) == 0)
    goto LABEL_18;
LABEL_19:
  v14 = __sb__runningInSpringBoard();
  v15 = v14;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v16 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom") != 1)
    {
      v16 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v16 = v17 >= *(double *)(MEMORY[0x1E0DAB260] + 248);
  if ((v2 & 1) == 0)

  if ((v15 & 1) == 0)
    goto LABEL_30;
LABEL_31:
  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
    {
      v20 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom") != 1 || SBFEffectiveHomeButtonType() != 2)
    {
      v20 = 0;
LABEL_44:

      goto LABEL_45;
    }
  }
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v20 = v21 >= *(double *)(MEMORY[0x1E0DAB260] + 328);
  if ((v2 & 1) == 0)

  if ((v19 & 1) == 0)
    goto LABEL_44;
LABEL_45:
  v22 = __sb__runningInSpringBoard();
  v23 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom") != 1 || SBFEffectiveHomeButtonType() != 2)
    {
      v8 = 0;
      goto LABEL_61;
    }
LABEL_51:
    v24 = __sb__runningInSpringBoard();
    v25 = v24;
    if (v24)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v26 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v8 = -[SBApplicationInfo isPeaceBLinked](self->_appInfo, "isPeaceBLinked");
      if ((v25 & 1) != 0)
        goto LABEL_60;
    }
    else
    {
      v8 = 0;
      if ((v25 & 1) != 0)
      {
LABEL_60:
        if ((v23 & 1) != 0)
          goto LABEL_62;
LABEL_61:

        goto LABEL_62;
      }
    }

    goto LABEL_60;
  }
  if (SBFEffectiveDeviceClass() == 2 && SBFEffectiveHomeButtonType() == 2)
    goto LABEL_51;
  v8 = 0;
LABEL_62:
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v27 = v117;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
  if (!v28)
  {

    goto LABEL_84;
  }
  v29 = v28;
  v114 = v6;
  v30 = *(_QWORD *)v132;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v132 != v30)
        objc_enumerationMutation(v27);
      objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * i), "referenceSize", v114);
      if (v12 && BSSizeEqualToSize())
      {
        supportedTypes = self->_supportedTypes;
        if ((_DWORD)v8)
          v33 = supportedTypes | 0x18000000;
        else
          v33 = supportedTypes | 0x8000000;
        goto LABEL_78;
      }
      if (v16 && BSSizeEqualToSize())
      {
        v33 = self->_supportedTypes | 0x400000;
LABEL_78:
        self->_supportedTypes = v33;
        continue;
      }
      if (v20 && BSSizeEqualToSize())
      {
        v33 = self->_supportedTypes | 0x800000;
        goto LABEL_78;
      }
    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
  }
  while (v29);

  v6 = v114;
  if (!self)
    goto LABEL_86;
LABEL_84:
  if (-[SBApplicationInfo isPeaceBLinked](self->_appInfo, "isPeaceBLinked"))
    self->_supportedTypes |= 0x20000uLL;
LABEL_86:
  if (!-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 1))
    goto LABEL_331;
  v34 = __sb__runningInSpringBoard();
  v35 = MEMORY[0x1E0DAB260];
  v36 = (double *)MEMORY[0x1E0DAB260];
  if (!(_DWORD)v34)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v8, "userInterfaceIdiom"))
      goto LABEL_93;
    v37 = 0;
    v38 = 1;
LABEL_98:
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "userInterfaceIdiom");

    v122 = (v42 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    if ((v37 & 1) == 0)
      goto LABEL_102;
LABEL_99:

    if ((v38 & 1) != 0)
      goto LABEL_103;
    goto LABEL_104;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
  {
    v37 = 0;
    v38 = 0;
    goto LABEL_98;
  }
LABEL_93:
  v38 = v34 ^ 1;
  v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v40 < *(double *)(v35 + 40))
  {
    v37 = v39 ^ 1;
    goto LABEL_98;
  }
  v122 = 1;
  if ((v39 & 1) == 0)
    goto LABEL_99;
LABEL_102:
  if (v38)
LABEL_103:

LABEL_104:
  v43 = __sb__runningInSpringBoard();
  if (!(_DWORD)v43)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v8, "userInterfaceIdiom"))
    {
      v46 = 0;
      v45 = 1;
      goto LABEL_116;
    }
LABEL_110:
    v44 = v36;
    goto LABEL_111;
  }
  if (!SBFEffectiveDeviceClass())
    goto LABEL_110;
  v44 = v36;
  if (SBFEffectiveDeviceClass() != 1)
  {
    v45 = 0;
    v46 = 0;
    goto LABEL_116;
  }
LABEL_111:
  v45 = v43 ^ 1;
  v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v43, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v48 >= v44[7])
  {
    v121 = 1;
    if ((v47 & 1) == 0)
      goto LABEL_117;
LABEL_120:
    if (!v45)
      goto LABEL_122;
    goto LABEL_121;
  }
  v46 = v47 ^ 1;
LABEL_116:
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v44 = (double *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v44, "userInterfaceIdiom");

  v121 = (v49 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if ((v46 & 1) == 0)
    goto LABEL_120;
LABEL_117:

  if ((v45 & 1) != 0)
LABEL_121:

LABEL_122:
  v50 = __sb__runningInSpringBoard();
  v114 = v6;
  if (v50)
  {
    if (SBFEffectiveDeviceClass())
    {
      v51 = v36;
      if (SBFEffectiveDeviceClass() != 1)
      {
        v52 = 0;
        v53 = 0;
        goto LABEL_133;
      }
    }
    else
    {
      v51 = v36;
    }
LABEL_129:
    v52 = v50 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v54 = __sb__runningInSpringBoard();
      if (v54)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "_referenceBounds");
      }
      v53 = v54 ^ 1;
      BSSizeRoundForScale();
      if (v59 >= v51[11])
      {
        v126 = 1;
        goto LABEL_161;
      }
    }
    else
    {
      v53 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    v51 = v36;
    if (!objc_msgSend(v44, "userInterfaceIdiom"))
      goto LABEL_129;
    v53 = 0;
    v52 = 1;
  }
LABEL_133:
  v55 = __sb__runningInSpringBoard();
  v56 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v36 = (double *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "userInterfaceIdiom") == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2)
        goto LABEL_139;
      v126 = 0;
      goto LABEL_160;
    }

LABEL_142:
    v126 = 0;
    goto LABEL_161;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_142;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    v126 = 0;
    goto LABEL_151;
  }
LABEL_139:
  v6 = v44;
  v57 = __sb__runningInSpringBoard();
  v58 = v57;
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v126 = v60 >= v51[53];
  if ((v58 & 1) == 0)

  v44 = v6;
  if ((v56 & 1) != 0)
  {
LABEL_151:
    if (!v53)
      goto LABEL_152;
LABEL_162:

    if ((v52 & 1) == 0)
      goto LABEL_154;
LABEL_153:

    goto LABEL_154;
  }
LABEL_160:

LABEL_161:
  if ((v53 & 1) != 0)
    goto LABEL_162;
LABEL_152:
  if (v52)
    goto LABEL_153;
LABEL_154:
  v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v62 = 0;
      v63 = 0;
      goto LABEL_168;
    }
LABEL_164:
    v62 = v61 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v64 = __sb__runningInSpringBoard();
      if (v64)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "_referenceBounds");
      }
      v63 = v64 ^ 1;
      BSSizeRoundForScale();
      if (v70 >= v51[15])
      {
        v67 = 1;
        goto LABEL_196;
      }
    }
    else
    {
      v63 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "userInterfaceIdiom"))
      goto LABEL_164;
    v63 = 0;
    v62 = 1;
  }
LABEL_168:
  v65 = __sb__runningInSpringBoard();
  v66 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v36 = (double *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "userInterfaceIdiom") == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2)
        goto LABEL_174;
      v67 = 0;
      goto LABEL_195;
    }

LABEL_177:
    v67 = 0;
    goto LABEL_196;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_177;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    v67 = 0;
    goto LABEL_186;
  }
LABEL_174:
  v123 = v44;
  v6 = (double *)0x1E0CEA000;
  v68 = __sb__runningInSpringBoard();
  v69 = v68;
  if (v68)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v67 = v71 >= v51[53];
  if ((v69 & 1) == 0)

  v44 = v123;
  if ((v66 & 1) != 0)
  {
LABEL_186:
    v72 = v124;
    if (!v63)
      goto LABEL_187;
LABEL_197:

    if ((v62 & 1) == 0)
      goto LABEL_189;
LABEL_188:

    goto LABEL_189;
  }
LABEL_195:

LABEL_196:
  v72 = v124;
  if ((v63 & 1) != 0)
    goto LABEL_197;
LABEL_187:
  if (v62)
    goto LABEL_188;
LABEL_189:
  v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v74 = 0;
      v75 = 0;
      goto LABEL_203;
    }
LABEL_199:
    v74 = v73 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v76 = __sb__runningInSpringBoard();
      if (v76)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v123 = (double *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "_referenceBounds");
      }
      v75 = v76 ^ 1;
      BSSizeRoundForScale();
      if (v81 >= v51[13])
      {
        v125 = 1;
        goto LABEL_231;
      }
    }
    else
    {
      v75 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "userInterfaceIdiom"))
      goto LABEL_199;
    v75 = 0;
    v74 = 1;
  }
LABEL_203:
  v77 = __sb__runningInSpringBoard();
  v78 = v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v36 = (double *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "userInterfaceIdiom") == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2)
        goto LABEL_209;
      v125 = 0;
      goto LABEL_230;
    }

LABEL_212:
    v125 = 0;
    goto LABEL_231;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_212;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    v125 = 0;
    goto LABEL_221;
  }
LABEL_209:
  v120 = v44;
  v6 = (double *)0x1E0CEA000;
  v79 = __sb__runningInSpringBoard();
  v80 = v79;
  if (v79)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v125 = v82 >= v51[53];
  if ((v80 & 1) == 0)

  v44 = v120;
  if ((v78 & 1) != 0)
  {
LABEL_221:
    v83 = v123;
    if (!v75)
      goto LABEL_222;
LABEL_232:

    if ((v74 & 1) == 0)
      goto LABEL_224;
LABEL_223:

    goto LABEL_224;
  }
LABEL_230:

LABEL_231:
  v83 = v123;
  if ((v75 & 1) != 0)
    goto LABEL_232;
LABEL_222:
  if (v74)
    goto LABEL_223;
LABEL_224:
  v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v85 = 0;
      v86 = 0;
      goto LABEL_238;
    }
LABEL_234:
    v85 = v84 ^ 1u;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v87 = __sb__runningInSpringBoard();
      if (v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v123 = (double *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "_referenceBounds");
      }
      v86 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v93 >= v51[17])
      {
        v90 = 1;
        goto LABEL_271;
      }
    }
    else
    {
      v86 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (double *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v120, "userInterfaceIdiom"))
      goto LABEL_234;
    v86 = 0;
    v85 = 1;
  }
LABEL_238:
  v88 = __sb__runningInSpringBoard();
  v89 = v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (double *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2)
        goto LABEL_244;
      v90 = 0;
      goto LABEL_270;
    }

LABEL_247:
    v90 = 0;
    goto LABEL_271;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_247;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    v90 = 0;
    goto LABEL_256;
  }
LABEL_244:
  v91 = __sb__runningInSpringBoard();
  v92 = v91;
  if (v91)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v44 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v90 = v94 >= v51[53];
  if ((v92 & 1) == 0)

  if ((v89 & 1) != 0)
  {
LABEL_256:
    v95 = v123;
    if (!v86)
      goto LABEL_257;
LABEL_272:

    if ((v85 & 1) == 0)
      goto LABEL_259;
LABEL_258:

    goto LABEL_259;
  }
LABEL_270:

LABEL_271:
  v95 = v123;
  if ((v86 & 1) != 0)
    goto LABEL_272;
LABEL_257:
  if ((_DWORD)v85)
    goto LABEL_258;
LABEL_259:
  v96 = __sb__runningInSpringBoard();
  v97 = v96;
  if (v96)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v98 = 0;
      goto LABEL_301;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      v98 = 0;
      if ((v97 & 1) != 0)
        goto LABEL_301;
LABEL_300:

      goto LABEL_301;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v85, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    {
      v98 = 0;
      goto LABEL_300;
    }
  }
  v99 = __sb__runningInSpringBoard();
  v100 = v99;
  if (v99)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v123 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v101 < v51[9])
  {
    v98 = 0;
    if ((v100 & 1) == 0)
      goto LABEL_278;
LABEL_299:
    if ((v97 & 1) != 0)
      goto LABEL_301;
    goto LABEL_300;
  }
  v102 = (double *)0x1E0CEA000;
  v103 = __sb__runningInSpringBoard();
  v104 = v103;
  if (!v103)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (double *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v102, "userInterfaceIdiom"))
    {
      if (SBFEffectiveHomeButtonType() != 2)
      {
        v120 = v102;
        v98 = 1;
LABEL_335:

        if ((v100 & 1) != 0)
          goto LABEL_299;
        goto LABEL_278;
      }
LABEL_291:
      v119 = __sb__runningInSpringBoard();
      v120 = v102;
      if (v119)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v98 = v105 < v51[11];
      if ((v119 & 1) != 0)
      {
        if ((v104 & 1) != 0)
          goto LABEL_298;
      }
      else
      {

        if ((v104 & 1) != 0)
          goto LABEL_298;
      }
      goto LABEL_335;
    }

LABEL_288:
    v98 = 1;
    if ((v100 & 1) != 0)
      goto LABEL_299;
    goto LABEL_278;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    goto LABEL_288;
  if (SBFEffectiveHomeButtonType() == 2)
    goto LABEL_291;
  v98 = 1;
  if ((v104 & 1) == 0)
    goto LABEL_335;
LABEL_298:
  if ((v100 & 1) != 0)
    goto LABEL_299;
LABEL_278:

  if ((v97 & 1) == 0)
    goto LABEL_300;
LABEL_301:
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v106 = v117;
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
  if (!v107)
    goto LABEL_330;
  v108 = v107;
  v109 = *(_QWORD *)v128;
  v110 = v90 || v125;
  while (2)
  {
    v111 = 0;
    while (2)
    {
      if (*(_QWORD *)v128 != v109)
        objc_enumerationMutation(v106);
      objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v111), "referenceSize", v114);
      if (v110 && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0))
      {
        v112 = 2176;
        goto LABEL_327;
      }
      if (v98 && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0))
      {
        v112 = 32;
        goto LABEL_327;
      }
      if (v67 && (BSSizeEqualToSize() & 1) != 0)
      {
        v112 = 1024;
        goto LABEL_327;
      }
      if (v126 && (BSSizeEqualToSize() & 1) != 0)
      {
        v112 = 64;
        goto LABEL_327;
      }
      if ((v122 || v121) && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0))
      {
        v112 = 28;
        goto LABEL_327;
      }
      if (BSSizeEqualToSize())
      {
        v112 = 4;
LABEL_327:
        self->_supportedTypes |= v112;
      }
      if (v108 != ++v111)
        continue;
      break;
    }
    v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
    if (v108)
      continue;
    break;
  }
LABEL_330:

  v6 = v114;
LABEL_331:

LABEL_332:
  v113 = -[SBApplication _snapshotManifest](self, "_snapshotManifest", v114);
  self->_calculatedSupportedTypes = 1;
}

- (BOOL)classicAppNonFullScreenWithHomeAffordance
{
  void *v2;
  int v5;
  char v6;
  BOOL v7;

  if (SBFEffectiveHomeButtonType() != 2
    || -[SBApplication classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen](self, "classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen"))
  {
    return 0;
  }
  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      return -[SBApplication isClassic](self, "isClassic");
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v6 & 1) != 0)
        return -[SBApplication isClassic](self, "isClassic");
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_16:

      return -[SBApplication isClassic](self, "isClassic");
    }
  }
  v7 = SBApplicationClassicModeExpectsRoundedCorners(-[SBApplication _classicMode](self, "_classicMode"));
  if ((v6 & 1) == 0)

  if (v7)
    return 0;
  return -[SBApplication isClassic](self, "isClassic");
}

- (BOOL)classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;
  int v6;
  char v7;
  BOOL v8;
  int v9;
  char v10;
  int v11;
  char v12;
  char v13;
  char v14;
  int v15;
  char v16;
  char v17;
  char v18;
  char v19;
  int v20;
  char v21;
  BOOL v22;
  int v23;
  char v24;
  int v25;
  char v26;
  int v27;
  char v28;
  int v29;
  char v30;
  char v31;
  int v32;
  char v33;
  char v34;
  char v35;
  int v36;
  char v37;
  char v38;
  char v39;
  int v40;
  char v41;
  char v42;
  char v43;
  int v44;
  char v45;
  char v46;
  char v47;
  BOOL v48;
  int v50;
  char v51;
  char v52;

  v5 = -[SBApplication _classicMode](self, "_classicMode");
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize())
  {
    v8 = v5 == 17;
    goto LABEL_14;
  }
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (!BSSizeEqualToSize())
  {
    v8 = 0;
    if ((v10 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v8 = v5 == 17;
  if ((v10 & 1) == 0)
LABEL_13:

LABEL_14:
  if ((v7 & 1) == 0)

  if (v8)
    return 1;
  v11 = __sb__runningInSpringBoard();
  v12 = v11;
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v13 = BSSizeEqualToSize();
  if (v5 == 16)
    v14 = v13;
  else
    v14 = 0;
  if ((v12 & 1) == 0)

  if ((v14 & 1) != 0)
    return 1;
  v15 = __sb__runningInSpringBoard();
  v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v17 = BSSizeEqualToSize();
  v18 = v5 == 20;
  if (v5 == 20)
    v19 = v17;
  else
    v19 = 0;
  if ((v16 & 1) == 0)

  if ((v19 & 1) != 0)
    return 1;
  v20 = __sb__runningInSpringBoard();
  v21 = v20;
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (!BSSizeEqualToSize())
  {
    v23 = __sb__runningInSpringBoard();
    v24 = v23;
    if (v23)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if ((BSSizeEqualToSize() & 1) != 0)
    {
      v22 = v5 == 15;
      goto LABEL_54;
    }
    v25 = __sb__runningInSpringBoard();
    v26 = v25;
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if ((BSSizeEqualToSize() & 1) != 0)
    {
      v22 = v5 == 15;
      if ((v26 & 1) != 0)
      {
LABEL_54:
        if ((v24 & 1) != 0)
        {
          if ((v21 & 1) == 0)
            goto LABEL_59;
        }
        else
        {

          if ((v21 & 1) == 0)
            goto LABEL_59;
        }
LABEL_56:
        if (!v22)
          goto LABEL_60;
        return 1;
      }
    }
    else
    {
      v22 = 0;
      if ((v26 & 1) != 0)
        goto LABEL_54;
    }

    goto LABEL_54;
  }
  v22 = v5 == 15;
  if ((v21 & 1) != 0)
    goto LABEL_56;
LABEL_59:

  if (v22)
    return 1;
LABEL_60:
  v27 = __sb__runningInSpringBoard();
  v28 = v27;
  if (v27)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    v29 = __sb__runningInSpringBoard();
    v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v31 = BSSizeEqualToSize();
    v18 = v5 == 20 ? v31 : 0;
    if ((v30 & 1) == 0)

  }
  if ((v28 & 1) == 0)

  if ((v18 & 1) != 0)
    return 1;
  v32 = __sb__runningInSpringBoard();
  v33 = v32;
  if (v32)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v34 = BSSizeEqualToSize();
  if (v5 == 22)
    v35 = v34;
  else
    v35 = 0;
  if ((v33 & 1) == 0)

  if ((v35 & 1) != 0)
    return 1;
  v36 = __sb__runningInSpringBoard();
  v37 = v36;
  if (v36)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v38 = BSSizeEqualToSize();
  if (v5 == 21)
    v39 = v38;
  else
    v39 = 0;
  if ((v37 & 1) == 0)

  if ((v39 & 1) != 0)
    return 1;
  v40 = __sb__runningInSpringBoard();
  v41 = v40;
  if (v40)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v42 = BSSizeEqualToSize();
  if (v5 == 18)
    v43 = v42;
  else
    v43 = 0;
  if ((v41 & 1) == 0)

  if ((v43 & 1) != 0)
    return 1;
  v44 = __sb__runningInSpringBoard();
  v45 = v44;
  if (v44)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v46 = BSSizeEqualToSize();
  if (v5 == 17)
    v47 = v46;
  else
    v47 = 0;
  if ((v45 & 1) == 0)

  if ((v47 & 1) != 0)
    return 1;
  v50 = __sb__runningInSpringBoard();
  v51 = v50;
  if (v50)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v52 = BSSizeEqualToSize();
  if (v5 == 16)
    v48 = v52;
  else
    v48 = 0;
  if ((v51 & 1) == 0)

  return v48;
}

- (BOOL)supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4
{
  id v6;

  v6 = a4;
  if (a3 == 2)
    LODWORD(self) = !-[SBApplication alwaysMaximizedInChamois](self, "alwaysMaximizedInChamois");
  else
    LOBYTE(self) = a3 == 1 && -[SBApplication isMedusaCapable](self, "isMedusaCapable");

  return (char)self;
}

- (id)_defaultPNGNameFromSuspensionSettingsWithExpiration:(double *)a3 sceneID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;

  v6 = a4;
  -[SBApplication _dataStore](self, "_dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeObjectForKey:ofType:", CFSTR("expirationAbsoluteTime"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  if (a3)
    *a3 = v10;
  if (v9 && v10 <= CFAbsoluteTimeGetCurrent())
  {

  }
  else
  {
    objc_msgSend(v8, "safeObjectForKey:ofType:", CFSTR("defaultPNGName"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_15;
  }
  objc_msgSend(v8, "safeObjectForKey:ofType:", CFSTR("expirationAbsoluteTime"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  if (a3)
    *a3 = v13;
  if (v12 && v13 <= CFAbsoluteTimeGetCurrent())
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "safeObjectForKey:ofType:", CFSTR("defaultPNGName"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v11;
}

- (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:", v4, -[SBApplication _classicMode](self, "_classicMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  id v45;

  v6 = a3;
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((unint64_t)(a4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && objc_msgSend(v7, "isMainRootDisplay"))
  {
    objc_msgSend(a1, "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v6, a4);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "currentMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "_copyWithOverrideSize:", v10, v12);

    v15 = (void *)objc_msgSend(v6, "copyWithOverrideMode:", v14);
    if (SBApplicationClassicModeRepresentsMoreSpace(a4))
    {
      objc_msgSend(v15, "pixelSize");
      v17 = v16;
      v19 = v18;
      objc_msgSend(a1, "_standardCanvasSizeForClassicMode:", a4);
      v21 = v20;
      v23 = v22;
      objc_msgSend(v15, "pointScale");
      v25 = v23 * v24;
      v26 = v21 * v24;
      if (v17 != v26 || v19 != v25)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D230B0]), "initWithConfiguration:", v15);
        objc_msgSend(v15, "_nativeBounds");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(v15, "bounds");
        objc_msgSend(v28, "setPixelSize:nativeBounds:bounds:", v26, v25, v30, v32, v34, v36, v37, v38, v39, v40);
        v45 = 0;
        objc_msgSend(v28, "buildConfigurationWithError:", &v45);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v45;

        if (v42)
        {
          SBLogClassicMode();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            +[SBApplication(Classic) restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:].cold.1(v42, v43);

        }
        v15 = (void *)v41;
      }
    }

    v6 = v15;
  }

  return v6;
}

- (id)_dataStore
{
  return self->_dataStore;
}

- (BOOL)includesStatusBarInClassicJailForInterfaceOrientation:(int64_t)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  LODWORD(v5) = -[SBApplication isClassic](self, "isClassic");
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (-[SBApplication _classicAppScaledPhoneOnPad](self, "_classicAppScaledPhoneOnPad"))
      {
        LOBYTE(v5) = 0;
      }
      else if (SBFEffectiveHomeButtonType() == 2
             && !-[SBApplication classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen](self, "classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen"))
      {
        LODWORD(v5) = -[SBApplication classicAppWithOwnSafeArea](self, "classicAppWithOwnSafeArea");
        if ((_DWORD)v5)
        {
          if (__sb__runningInSpringBoard())
          {
            __sb__mainScreenReferenceBounds();
            BSSizeRoundForScale();
            v10 = v9;
            v12 = v11;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_referenceBounds");
            BSSizeRoundForScale();
            v10 = v14;
            v12 = v15;

          }
          v16 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v18, -[SBApplication _classicMode](self, "_classicMode"));
          v20 = v19;
          v22 = v21;

          if (v20 == v10 && v22 == v12)
          {
            LOBYTE(v5) = -[SBApplication classicAppFullScreen](self, "classicAppFullScreen");
          }
          else if ((unint64_t)(a3 - 3) >= 2)
          {
            LOBYTE(v5) = v12 / v10 < v22 / v20;
          }
          else
          {
            LOBYTE(v5) = v12 / v10 > v22 / v20;
          }
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      v8 = SBFEffectiveHomeButtonType();
      v5 = -[SBApplication _classicMode](self, "_classicMode");
      if (v8 == 2)
        LOBYTE(v5) = SBApplicationClassicModeExpectsRoundedCorners(v5);
      else
        LOBYTE(v5) = v5 != 1;
    }
  }
  return v5;
}

+ (CGSize)_defaultLaunchingSizeForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if ((unint64_t)(a4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(a3, "bounds", v4, v5);
    v6 = v8;
    v7 = v9;
  }
  else
  {
    objc_msgSend(a1, "_defaultLaunchingSizeForClassicMode:", a4);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSArray)tags
{
  return (NSArray *)-[SBApplicationInfo tags](self->_appInfo, "tags");
}

- (BOOL)isAppClip
{
  return -[SBApplicationInfo isAppClip](self->_appInfo, "isAppClip");
}

- (BOOL)hasHiddenTag
{
  return -[SBApplicationInfo hasHiddenTag](self->_appInfo, "hasHiddenTag");
}

- (NSString)displayName
{
  return -[SBApplicationInfo displayName](self->_appInfo, "displayName");
}

- (void)setDynamicApplicationShortcutItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[SBApplicationShortcutStoreManager sharedManager](SBApplicationShortcutStoreManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationShortcutItems:forBundleIdentifier:withVersion:", v4, v5, -[SBApplicationInfo dynamicApplicationShortcutItemsVersion](self->_appInfo, "dynamicApplicationShortcutItemsVersion"));

}

- (NSArray)dynamicApplicationShortcutItems
{
  void *v3;
  void *v4;
  void *v5;

  +[SBApplicationShortcutStoreManager sharedManager](SBApplicationShortcutStoreManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationShortcutItemsForBundleIdentifier:withVersion:", v4, -[SBApplicationInfo dynamicApplicationShortcutItemsVersion](self->_appInfo, "dynamicApplicationShortcutItemsVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)_setRecentlyUpdated:(BOOL)a3
{
  _BOOL8 v3;
  FBSApplicationDataStore *dataStore;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  NSString *bundleIdentifier;
  const char *v11;
  NSString *v12;
  int v13;
  NSString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[SBApplication _isRecentlyUpdated](self, "_isRecentlyUpdated") != a3)
  {
    dataStore = self->_dataStore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:", v6, CFSTR("SBApplicationRecentlyUpdated"));

    if (v3)
      v7 = 1;
    else
      v7 = 2;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xF8 | v7;
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v9)
      {
        bundleIdentifier = self->_bundleIdentifier;
        v13 = 138543362;
        v14 = bundleIdentifier;
        v11 = "%{public}@ is now recently updated.";
LABEL_10:
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v9)
    {
      v12 = self->_bundleIdentifier;
      v13 = 138543362;
      v14 = v12;
      v11 = "%{public}@ is no longer recently updated.";
      goto LABEL_10;
    }

    -[SBApplication _updateRecentlyUpdatedTimer](self, "_updateRecentlyUpdatedTimer");
    -[SBApplication _noteIconDataSourceDidChange](self, "_noteIconDataSourceDidChange");
  }
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if ((-[SBApplicationInfo isBlockedForScreenTimeExpiration](self->_appInfo, "isBlockedForScreenTimeExpiration", a3) & 1) != 0)
    return 4;
  if (-[SBApplicationInfo isCloudDemoted](self->_appInfo, "isCloudDemoted"))
    return 3;
  if ((-[SBApplication _isNewlyInstalled](self, "_isNewlyInstalled")
     || -[SBApplication _isRecentlyUpdated](self, "_isRecentlyUpdated"))
    && !-[SBApplication isSystemApplication](self, "isSystemApplication"))
  {
    return 1;
  }
  if (-[SBApplicationInfo isBeta](self->_appInfo, "isBeta"))
    return 2;
  return 0;
}

- (BOOL)_isRecentlyUpdated
{
  char v2;
  void *v4;
  int v5;

  v2 = *((_BYTE *)self + 80) & 7;
  if (!v2)
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationRecentlyUpdated"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
      v2 = 1;
    else
      v2 = 2;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xF8 | v2;
  }
  return v2 == 1;
}

- (int64_t)_classicModeFromSupportedTypes
{
  void *v2;
  int64_t v4;
  int v5;
  char v6;
  void *v8;
  int v9;
  char v10;
  double *v11;
  BOOL v12;
  int v13;
  char v14;
  int v15;
  char v16;
  BOOL v17;
  int v18;
  char v19;
  BOOL v20;
  BOOL v21;
  double v22;
  BOOL v23;
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  char v29;
  char v30;
  char v31;
  BOOL v32;
  BOOL v33;
  double v34;
  BOOL v35;
  int v36;
  char v37;
  int v38;
  char v39;
  int v40;
  char v41;
  int v42;
  char v43;
  char v44;
  char v45;
  int v46;
  char v47;
  char v48;
  char v49;
  int v50;
  char v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  int v55;
  char v56;
  int v57;
  char v58;
  int v59;
  char v60;
  char v61;
  char v62;
  BOOL v63;
  char v64;
  int v65;
  char v66;
  BOOL v67;
  int v68;
  char v69;
  int v70;
  char v71;
  BOOL v72;
  BOOL v73;
  int v74;
  char v75;
  int v76;
  char v77;
  BOOL v78;
  BOOL v79;
  int v80;
  char v81;
  int v82;
  char v83;
  BOOL v84;
  BOOL v85;
  int v86;
  char v87;
  int v88;
  char v89;
  BOOL v90;
  BOOL v91;
  int v92;
  char v93;
  int v94;
  char v95;
  BOOL v96;
  BOOL v97;
  int v98;
  char v99;
  int v100;
  char v101;
  BOOL v102;
  BOOL v103;
  int v104;
  char v105;
  int v106;
  char v107;
  BOOL v108;
  int v109;
  int v110;
  char v111;
  BOOL v112;
  BOOL v113;
  int v114;
  char v115;
  int v116;
  char v117;
  BOOL v118;
  BOOL v119;
  int v120;
  char v121;
  int v122;
  char v123;
  BOOL v124;
  int v125;
  char v126;
  int v127;
  char v128;
  BOOL v129;
  int v130;
  char v131;
  double v132;
  BOOL v133;
  int v134;
  char v135;
  BOOL v136;
  int v137;
  char v138;
  BOOL v139;
  int v140;
  char v141;
  BOOL v142;
  int v143;
  char v144;
  int v145;
  char v146;
  BOOL v147;
  int v148;
  char v149;
  BOOL v150;
  int v151;
  char v152;
  double v153;
  BOOL v154;
  int v155;
  char v156;
  int v157;
  char v158;
  int v159;
  char v160;
  BOOL v161;
  int v162;
  char v163;
  double v164;
  BOOL v165;
  BOOL v166;
  int v167;
  char v168;
  int v169;
  char v170;
  double v171;
  _BOOL4 v172;
  BOOL v173;
  int v174;
  char v175;
  BOOL v176;
  int v177;
  char v178;
  BOOL v179;
  int v180;
  char v181;
  BOOL v182;
  int v183;
  char v184;
  BOOL v185;
  int v186;
  char v187;
  BOOL v188;
  int v189;
  double v190;
  double v191;

  if (-[SBApplicationInfo usesSplashBoard](self->_appInfo, "usesSplashBoard")
    && !-[SBApplication _useSupportedTypesForSplashBoard](self, "_useSupportedTypesForSplashBoard"))
  {
    return -1;
  }
  if ((-[SBApplication _bypassesClassicMode]((uint64_t)self) & 1) != 0)
    return 0;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v8, "userInterfaceIdiom");

    if (v2 != (void *)1)
    {
LABEL_7:
      v5 = __sb__runningInSpringBoard();
      v6 = v5;
      if (v5)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v11 = (double *)MEMORY[0x1E0DAB260];
      if (BSSizeEqualToSize())
      {
        v12 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x2000);
        if ((v6 & 1) != 0)
        {
LABEL_26:
          if (v12)
            goto LABEL_294;
          v15 = __sb__runningInSpringBoard();
          v16 = v15;
          if (v15)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "_referenceBounds");
          }
          BSSizeRoundForScale();
          if (BSSizeEqualToSize())
          {
            v17 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4096);
            if ((v16 & 1) != 0)
              goto LABEL_37;
          }
          else
          {
            v17 = 0;
            if ((v16 & 1) != 0)
            {
LABEL_37:
              if (v17)
                goto LABEL_294;
              v18 = __sb__runningInSpringBoard();
              v19 = v18;
              if (v18)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              v22 = v11[17];
              if (BSSizeEqualToSize())
                v23 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2048);
              else
                v23 = 0;
              if ((v19 & 1) == 0)

              if (v23)
                goto LABEL_294;
              v28 = __sb__runningInSpringBoard();
              v29 = v28;
              if (v28)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              v34 = v11[15];
              if (BSSizeEqualToSize())
                v35 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 1024);
              else
                v35 = 0;
              if ((v29 & 1) == 0)

              if (v35)
                goto LABEL_294;
              v42 = __sb__runningInSpringBoard();
              v43 = v42;
              if (v42)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v54 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 512);
              else
                v54 = 0;
              if ((v43 & 1) == 0)

              if (v54)
                goto LABEL_294;
              v59 = __sb__runningInSpringBoard();
              v60 = v59;
              if (v59)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v67 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 256);
              else
                v67 = 0;
              if ((v60 & 1) == 0)

              if (v67)
                goto LABEL_294;
              v70 = __sb__runningInSpringBoard();
              v71 = v70;
              if (v70)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              v191 = v11[13];
              if (BSSizeEqualToSize())
                v73 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 128);
              else
                v73 = 0;
              if ((v71 & 1) == 0)

              if (v73)
                goto LABEL_294;
              v76 = __sb__runningInSpringBoard();
              v77 = v76;
              if (v76)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v79 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 64);
              else
                v79 = 0;
              if ((v77 & 1) == 0)

              if (v79)
                goto LABEL_294;
              v82 = __sb__runningInSpringBoard();
              v83 = v82;
              if (v82)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v85 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 32);
              else
                v85 = 0;
              if ((v83 & 1) == 0)

              if (v85)
                goto LABEL_294;
              v88 = __sb__runningInSpringBoard();
              v89 = v88;
              if (v88)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v91 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 16);
              else
                v91 = 0;
              if ((v89 & 1) == 0)

              if (v91)
                goto LABEL_294;
              v94 = __sb__runningInSpringBoard();
              v95 = v94;
              if (v94)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              v190 = v11[5];
              if (BSSizeEqualToSize())
                v97 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 8);
              else
                v97 = 0;
              if ((v95 & 1) == 0)

              if (v97)
                goto LABEL_294;
              v100 = __sb__runningInSpringBoard();
              v101 = v100;
              if (v100)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize())
                v103 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4);
              else
                v103 = 0;
              if ((v101 & 1) == 0)

              if (v103)
              {
LABEL_294:
                if (+[SBApplication _displayZoomSizesOnThisDeviceNeedRedaction]())
                {
                  v106 = __sb__runningInSpringBoard();
                  v107 = v106;
                  if (v106)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                    v2 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "_referenceBounds");
                  }
                  BSSizeRoundForScale();
                  if (BSSizeEqualToSize())
                  {
                    v108 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 64);
                    if ((v107 & 1) != 0)
                      goto LABEL_303;
                  }
                  else
                  {
                    v108 = 0;
                    if ((v107 & 1) != 0)
                    {
LABEL_303:
                      if (v108)
                        return 6;
                      v109 = __sb__runningInSpringBoard();
                      v66 = v109;
                      if (v109)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                        v2 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v2, "_referenceBounds");
                      }
                      BSSizeRoundForScale();
                      if (BSSizeEqualToSize())
                      {
                        if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 32))
                          v4 = 5;
                        else
                          v4 = 0;
                      }
                      else
                      {
                        v4 = 0;
                      }
                      goto LABEL_313;
                    }
                  }

                  goto LABEL_303;
                }
                return 0;
              }
              v110 = __sb__runningInSpringBoard();
              v111 = v110;
              if (v110)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeLessThanSize())
                v113 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4096);
              else
                v113 = 0;
              if ((v111 & 1) == 0)

              if (v113)
                return 11;
              v116 = __sb__runningInSpringBoard();
              v117 = v116;
              if (v116)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              if (BSSizeLessThanSize())
                v119 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2048);
              else
                v119 = 0;
              if ((v117 & 1) == 0)

              if (!v119)
              {
                v122 = __sb__runningInSpringBoard();
                v123 = v122;
                if (v122)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    goto LABEL_391;
                  if (SBFEffectiveHomeButtonType() != 2)
                  {
                    if ((v123 & 1) != 0)
                      goto LABEL_391;
LABEL_371:

                    goto LABEL_391;
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
                    goto LABEL_371;
                }
                v125 = __sb__runningInSpringBoard();
                v126 = v125;
                if (v125)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v11 = (double *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "_referenceBounds");
                }
                BSSizeRoundForScale();
                if (v132 >= v22)
                {
                  v133 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 1024);
                  if ((v126 & 1) != 0)
                    goto LABEL_388;
                }
                else
                {
                  v133 = 0;
                  if ((v126 & 1) != 0)
                  {
LABEL_388:
                    if ((v123 & 1) == 0)

                    if (!v133)
                    {
LABEL_391:
                      v134 = __sb__runningInSpringBoard();
                      v135 = v134;
                      if (v134)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                        v2 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v2, "_referenceBounds");
                      }
                      BSSizeRoundForScale();
                      if (BSSizeLessThanSize())
                        v136 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 256);
                      else
                        v136 = 0;
                      if ((v135 & 1) == 0)

                      if (v136)
                        return 8;
                      v137 = __sb__runningInSpringBoard();
                      v138 = v137;
                      if (v137)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                        v2 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v2, "_referenceBounds");
                      }
                      BSSizeRoundForScale();
                      if (BSSizeLessThanSize())
                        v139 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 128);
                      else
                        v139 = 0;
                      if ((v138 & 1) == 0)

                      if (!v139)
                      {
                        v140 = __sb__runningInSpringBoard();
                        v141 = v140;
                        if (v140)
                        {
                          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                            goto LABEL_460;
                          if (SBFEffectiveHomeButtonType() != 2)
                          {
                            if ((v141 & 1) != 0)
                              goto LABEL_460;
LABEL_430:

                            goto LABEL_460;
                          }
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                          v2 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
                            goto LABEL_430;
                        }
                        v145 = __sb__runningInSpringBoard();
                        v146 = v145;
                        if (v145)
                        {
                          __sb__mainScreenReferenceBounds();
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                          v11 = (double *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v11, "_referenceBounds");
                        }
                        BSSizeRoundForScale();
                        if (v153 >= v191)
                        {
                          v154 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 64);
                          if ((v146 & 1) != 0)
                            goto LABEL_457;
                        }
                        else
                        {
                          v154 = 0;
                          if ((v146 & 1) != 0)
                          {
LABEL_457:
                            if ((v141 & 1) == 0)

                            if (v154)
                              return 6;
LABEL_460:
                            v155 = __sb__runningInSpringBoard();
                            v156 = v155;
                            if (v155)
                            {
                              if (SBFEffectiveDeviceClass()
                                && SBFEffectiveDeviceClass() != 1)
                              {
                                goto LABEL_471;
                              }
                              if (SBFEffectiveHomeButtonType() != 2)
                              {
                                if ((v156 & 1) != 0)
                                {
LABEL_471:
                                  v159 = __sb__runningInSpringBoard();
                                  v160 = v159;
                                  if (v159)
                                  {
                                    __sb__mainScreenReferenceBounds();
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                    v2 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v2, "_referenceBounds");
                                  }
                                  BSSizeRoundForScale();
                                  if (BSSizeGreaterThanOrEqualToSize())
                                    v161 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 8);
                                  else
                                    v161 = 0;
                                  if ((v160 & 1) == 0)

                                  if (!v161)
                                  {
                                    v162 = __sb__runningInSpringBoard();
                                    v163 = v162;
                                    if (v162)
                                    {
                                      if (SBFEffectiveDeviceClass()
                                        && SBFEffectiveDeviceClass() != 1)
                                      {
                                        return 1;
                                      }
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                      v2 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (objc_msgSend(v2, "userInterfaceIdiom"))
                                      {

                                        return 1;
                                      }
                                    }
                                    v169 = __sb__runningInSpringBoard();
                                    v170 = v169;
                                    if (v169)
                                    {
                                      __sb__mainScreenReferenceBounds();
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                      v11 = (double *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v11, "_referenceBounds");
                                    }
                                    BSSizeRoundForScale();
                                    if (v171 >= v190)
                                    {
                                      v172 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4);
                                      if ((v170 & 1) != 0)
                                        goto LABEL_515;
                                    }
                                    else
                                    {
                                      v172 = 0;
                                      if ((v170 & 1) != 0)
                                      {
LABEL_515:
                                        if ((v163 & 1) != 0)
                                        {
                                          if (!v172)
                                            return 1;
                                        }
                                        else
                                        {

                                          if (!v172)
                                            return 1;
                                        }
                                        return 2;
                                      }
                                    }

                                    goto LABEL_515;
                                  }
                                  return 3;
                                }
LABEL_470:

                                goto LABEL_471;
                              }
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                              v2 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
                                goto LABEL_470;
                            }
                            v157 = __sb__runningInSpringBoard();
                            v158 = v157;
                            if (v157)
                            {
                              __sb__mainScreenReferenceBounds();
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                              v11 = (double *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v11, "_referenceBounds");
                            }
                            BSSizeRoundForScale();
                            if (v164 >= v34)
                            {
                              v165 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 16);
                              if ((v158 & 1) != 0)
                                goto LABEL_492;
                            }
                            else
                            {
                              v165 = 0;
                              if ((v158 & 1) != 0)
                              {
LABEL_492:
                                if ((v156 & 1) != 0)
                                {
                                  if (!v165)
                                    goto LABEL_471;
                                }
                                else
                                {

                                  if (!v165)
                                    goto LABEL_471;
                                }
                                return 4;
                              }
                            }

                            goto LABEL_492;
                          }
                        }

                        goto LABEL_457;
                      }
                      return 7;
                    }
                    return 9;
                  }
                }

                goto LABEL_388;
              }
              return 10;
            }
          }

          goto LABEL_37;
        }
      }
      else
      {
        v12 = 0;
        if ((v6 & 1) != 0)
          goto LABEL_26;
      }

      goto LABEL_26;
    }
  }
  v2 = (void *)SBFEffectiveHomeButtonType();
  if (!-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2))
  {
    if (v2 == (void *)2)
    {
      if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2048))
      {
        v13 = __sb__runningInSpringBoard();
        v14 = v13;
        if (v13)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v30 = BSSizeGreaterThanOrEqualToSize();
        v31 = v30;
        if ((v14 & 1) != 0)
        {
          if ((v30 & 1) != 0)
            return 10;
        }
        else
        {

          if ((v31 & 1) != 0)
            return 10;
        }
      }
      if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 1024))
      {
        v36 = __sb__runningInSpringBoard();
        v37 = v36;
        if (v36)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v44 = BSSizeGreaterThanOrEqualToSize();
        v45 = v44;
        if ((v37 & 1) != 0)
        {
          if ((v44 & 1) != 0)
            return 9;
        }
        else
        {

          if ((v45 & 1) != 0)
            return 9;
        }
      }
      if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 128))
      {
        v46 = __sb__runningInSpringBoard();
        v47 = v46;
        if (v46)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v48 = BSSizeGreaterThanOrEqualToSize();
        v49 = v48;
        if ((v47 & 1) != 0)
        {
          if ((v48 & 1) != 0)
            return 7;
        }
        else
        {

          if ((v49 & 1) != 0)
            return 7;
        }
      }
      if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 64))
      {
        v50 = __sb__runningInSpringBoard();
        v51 = v50;
        if (v50)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v61 = BSSizeGreaterThanOrEqualToSize();
        v62 = v61;
        if ((v51 & 1) != 0)
        {
          if ((v61 & 1) != 0)
            return 6;
        }
        else
        {

          if ((v62 & 1) != 0)
            return 6;
        }
      }
    }
    if (!-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 8))
    {
      if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4))
        return 2;
      else
        return 1;
    }
    return 3;
  }
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v2 == (void *)2)
  {
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v20 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x40000000);
    else
      v20 = 0;
    if ((v10 & 1) == 0)

    if (v20)
      return 0;
    v24 = __sb__runningInSpringBoard();
    v25 = v24;
    if (v24)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v32 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x10000000);
    else
      v32 = 0;
    if ((v25 & 1) == 0)

    if (v32)
      return 0;
    v38 = __sb__runningInSpringBoard();
    v39 = v38;
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v52 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x800000);
    else
      v52 = 0;
    if ((v39 & 1) == 0)

    if (v52)
      return 0;
    v55 = __sb__runningInSpringBoard();
    v56 = v55;
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v63 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x2000000);
    else
      v63 = 0;
    if ((v56 & 1) == 0)

    if (v63)
      return 0;
    v68 = __sb__runningInSpringBoard();
    v69 = v68;
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v72 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x100000);
    else
      v72 = 0;
    if ((v69 & 1) == 0)

    if (v72)
      return 0;
    v74 = __sb__runningInSpringBoard();
    v75 = v74;
    if (v74)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v78 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x20000);
    else
      v78 = 0;
    if ((v75 & 1) == 0)

    if (v78)
      return 0;
    v80 = __sb__runningInSpringBoard();
    v81 = v80;
    if (v80)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v84 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x40000);
    else
      v84 = 0;
    if ((v81 & 1) == 0)

    if (v84)
      return 0;
    v86 = __sb__runningInSpringBoard();
    v87 = v86;
    if (v86)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v90 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x10000);
    else
      v90 = 0;
    if ((v87 & 1) == 0)

    if (v90)
      return 0;
    v92 = __sb__runningInSpringBoard();
    v93 = v92;
    if (v92)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v96 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x200000);
    else
      v96 = 0;
    if ((v93 & 1) == 0)

    if (v96)
      return 0;
    v98 = __sb__runningInSpringBoard();
    v99 = v98;
    if (v98)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v102 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x1000000);
    else
      v102 = 0;
    if ((v99 & 1) == 0)

    if (v102)
      return 0;
    v104 = __sb__runningInSpringBoard();
    v105 = v104;
    if (v104)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v112 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x4000000);
    else
      v112 = 0;
    if ((v105 & 1) == 0)

    if (v112)
      return 0;
    v114 = __sb__runningInSpringBoard();
    v115 = v114;
    if (v114)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v118 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x20000000);
    else
      v118 = 0;
    if ((v115 & 1) == 0)

    if (v118)
      return 0;
    v120 = __sb__runningInSpringBoard();
    v121 = v120;
    if (v120)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v124 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0xFFFFFFFF80000000);
    else
      v124 = 0;
    if ((v121 & 1) == 0)

    if (v124)
      return 0;
    v127 = __sb__runningInSpringBoard();
    v128 = v127;
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v129 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x20000000);
    else
      v129 = 0;
    if ((v128 & 1) == 0)

    if (v129)
      return 22;
    v130 = __sb__runningInSpringBoard();
    v131 = v130;
    if (v130)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v142 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x1000000);
    else
      v142 = 0;
    if ((v131 & 1) == 0)

    if (v142)
      return 19;
    v143 = __sb__runningInSpringBoard();
    v144 = v143;
    if (v143)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v147 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x40000000);
    else
      v147 = 0;
    if ((v144 & 1) == 0)

    if (v147)
      return 21;
    v148 = __sb__runningInSpringBoard();
    v149 = v148;
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v150 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x10000000);
    else
      v150 = 0;
    if ((v149 & 1) == 0)

    if (v150)
      return 20;
    v151 = __sb__runningInSpringBoard();
    v152 = v151;
    if (v151)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v166 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x8000000);
    else
      v166 = 0;
    if ((v152 & 1) == 0)

    if (v166)
      return 14;
    v167 = __sb__runningInSpringBoard();
    v168 = v167;
    if (v167)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v173 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x2000000);
    else
      v173 = 0;
    if ((v168 & 1) == 0)

    if (v173)
      return 18;
    v174 = __sb__runningInSpringBoard();
    v175 = v174;
    if (v174)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v176 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x800000);
    else
      v176 = 0;
    if ((v175 & 1) == 0)

    if (v176)
      return 17;
    v177 = __sb__runningInSpringBoard();
    v178 = v177;
    if (v177)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize())
      v179 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x10000000);
    else
      v179 = 0;
    if ((v178 & 1) == 0)

    if (v179)
      return 20;
    v180 = __sb__runningInSpringBoard();
    v181 = v180;
    if (v180)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v182 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x800000);
    else
      v182 = 0;
    if ((v181 & 1) == 0)

    if (v182)
      return 17;
    v183 = __sb__runningInSpringBoard();
    v184 = v183;
    if (v183)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v185 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x100000);
    else
      v185 = 0;
    if ((v184 & 1) == 0)

    if (v185)
      return 16;
    v186 = __sb__runningInSpringBoard();
    v187 = v186;
    if (v186)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
      v188 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x800000);
    else
      v188 = 0;
    if ((v187 & 1) == 0)

    if (v188)
      return 17;
    if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x20000))
      return 15;
    v189 = __sb__runningInSpringBoard();
    v66 = v189;
    if (!v189)
      goto LABEL_182;
LABEL_166:
    __sb__mainScreenReferenceBounds();
    goto LABEL_183;
  }
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize())
    v21 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x8000000);
  else
    v21 = 0;
  if ((v10 & 1) == 0)

  if (v21)
    return 0;
  v26 = __sb__runningInSpringBoard();
  v27 = v26;
  if (v26)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize())
    v33 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x80000);
  else
    v33 = 0;
  if ((v27 & 1) == 0)

  if (v33)
    return 0;
  v40 = __sb__runningInSpringBoard();
  v41 = v40;
  if (v40)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize())
    v53 = -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x400000);
  else
    v53 = 0;
  if ((v41 & 1) == 0)

  if (v53)
    return 0;
  v57 = __sb__runningInSpringBoard();
  v58 = v57;
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v64 = BSSizeEqualToSize();
  if ((v58 & 1) == 0)

  if ((v64 & 1) != 0)
    return 0;
  v65 = __sb__runningInSpringBoard();
  v66 = v65;
  if (v65)
    goto LABEL_166;
LABEL_182:
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
LABEL_183:
  BSSizeRoundForScale();
  if (BSSizeGreaterThanOrEqualToSize())
  {
    if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 0x400000))
      v4 = 13;
    else
      v4 = 12;
  }
  else
  {
    v4 = 12;
  }
LABEL_313:
  if ((v66 & 1) == 0)

  return v4;
}

- (BOOL)_isNewlyInstalled
{
  int v4;
  void *v5;
  int v6;

  if (-[SBApplication isSystemApplication](self, "isSystemApplication")
    || -[SBApplication isInternalApplication](self, "isInternalApplication"))
  {
    return 0;
  }
  v4 = *((_BYTE *)self + 80) & 0x38;
  if ((*((_BYTE *)self + 80) & 0x38) == 0)
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationIsNewlyInstalled"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      v4 = 8;
    else
      v4 = 16;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xC7 | v4;
  }
  return v4 == 8;
}

- (BOOL)isSystemApplication
{
  return -[SBApplicationInfo isSystemApplication](self->_appInfo, "isSystemApplication");
}

- (uint64_t)_bypassesClassicMode
{
  id *v1;

  if (result)
  {
    v1 = (id *)result;
    if ((objc_msgSend(*(id *)(result + 168), "disablesClassicMode") & 1) != 0
      || (objc_msgSend(v1[21], "hasViewServicesEntitlement") & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(v1, "isSystemApplication");
    }
  }
  return result;
}

- (BOOL)_useSupportedTypesForSplashBoard
{
  return 1;
}

- (BOOL)_supportsApplicationType:(unint64_t)a3
{
  return (self->_supportedTypes & a3) != 0;
}

- (BOOL)isInternalApplication
{
  return -[SBApplicationInfo isInternalApplication](self->_appInfo, "isInternalApplication");
}

- (BOOL)supportsMixedOrientationForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4
{
  id v6;

  v6 = a4;
  if (a3 >= 2)
  {
    if (a3 == 2)
      LODWORD(self) = !-[SBApplication supportsChamoisSceneResizing](self, "supportsChamoisSceneResizing");
    else
      LOBYTE(self) = 0;
  }
  else
  {
    LOBYTE(self) = -[SBApplication classicAppPhoneAppRunningOnPad](self, "classicAppPhoneAppRunningOnPad");
  }

  return (char)self;
}

- (BOOL)classicAppFullScreen
{
  int v4;

  if (SBFEffectiveHomeButtonType() == 2)
    return !-[SBApplication classicAppNonFullScreenWithHomeAffordance](self, "classicAppNonFullScreenWithHomeAffordance");
  if (-[SBApplication classicAppScaled](self, "classicAppScaled")
    && -[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 4))
  {
    v4 = !-[SBApplication _classicAppScaledPhoneOnPad](self, "_classicAppScaledPhoneOnPad");
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 | -[SBApplication _classicAppScaledPadOnPad](self, "_classicAppScaledPadOnPad");
}

- (BOOL)supportsChamoisViewResizing
{
  return !-[SBApplication alwaysMaximizedInChamois](self, "alwaysMaximizedInChamois");
}

- (BOOL)alwaysMaximizedInChamois
{
  void *v3;
  void *v4;

  if (alwaysMaximizedInChamois_onceToken != -1)
    dispatch_once(&alwaysMaximizedInChamois_onceToken, &__block_literal_global_143);
  v3 = (void *)alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs;
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  return (char)v3;
}

- (BOOL)iconAllowsLaunch:(id)a3
{
  return !-[SBApplication isAnyTerminationAssertionInEffect](self, "isAnyTerminationAssertionInEffect", a3);
}

- (BOOL)isAnyTerminationAssertionInEffect
{
  void *v2;
  int v3;

  if (self->_launchWillBePrevented)
  {
    -[SBApplication processState](self, "processState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isRunning") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isSetup
{
  void *v2;
  char v3;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v3;
}

- (NSString)iconIdentifier
{
  return self->_bundleIdentifier;
}

uint64_t __106__SBApplication_Classic_Private___niceScreenTypeForClassicType_matchingAValidDisplayZoomModeOnScreenType___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  int v7;

  result = SBHGetScreenSpecification();
  if (!*(_QWORD *)(a1 + 64))
  {
    result = BSSizeEqualToSize();
    if ((_DWORD)result)
    {
      v7 = *(unsigned __int8 *)(a1 + 120);
      result = SBHScreenTypeHasHomeButton();
      if (v7 == (_DWORD)result)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

- (id)tagsForIcon:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplication info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)classicAppScaled
{
  if (!self->_calculatedSupportedTypes)
    return 0;
  if (-[SBApplication _classicAppScaledOnPhone](self, "_classicAppScaledOnPhone")
    || -[SBApplication _classicAppScaledPadOnPad](self, "_classicAppScaledPadOnPad"))
  {
    return 1;
  }
  return -[SBApplication _classicAppScaledPhoneOnPad](self, "_classicAppScaledPhoneOnPad");
}

- (BOOL)_classicAppScaledOnPhone
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  BOOL v6;
  int v7;
  char v8;
  double v9;

  if (!-[SBApplication isClassic](self, "isClassic"))
    return 0;
  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {
      v6 = 0;
LABEL_14:

      return v6;
    }
  }
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v6 = v9 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
  if ((v8 & 1) == 0)

  if ((v5 & 1) == 0)
    goto LABEL_14;
  return v6;
}

- (BOOL)_classicAppScaledPadOnPad
{
  return SBApplicationClassicModeRepresentsPad(-[SBApplication _classicMode](self, "_classicMode"));
}

- (void)setBadgeValue:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  void *v7;
  FBSApplicationDataStore *dataStore;
  char v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!v4
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v4 = v10, (isKindOfClass & 1) != 0)
    || (objc_opt_class(), v6 = objc_opt_isKindOfClass(), v4 = v10, (v6 & 1) != 0))
  {
    if (objc_msgSend(v4, "isEqual:", &unk_1E91CFF78))
    {

      v10 = 0;
    }
    -[SBApplication badgeValue](self, "badgeValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v10) & 1) == 0)
    {
      dataStore = self->_dataStore;
      if (v10)
      {
        -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:", v10, CFSTR("SBApplicationBadgeKey"));
        v9 = 1;
      }
      else
      {
        -[FBSApplicationDataStore removeObjectForKey:](dataStore, "removeObjectForKey:", CFSTR("SBApplicationBadgeKey"));
        v9 = 2;
      }
      *((_BYTE *)self + 83) = *((_BYTE *)self + 83) & 0xF8 | v9;
      -[SBApplication _noteIconDataSourceDidChange](self, "_noteIconDataSourceDidChange");
    }

  }
}

- (id)badgeValue
{
  void *v2;
  char v4;

  if ((*((_BYTE *)self + 83) & 6) != 0)
  {
    v2 = 0;
  }
  else
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationBadgeKey"), objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v4 = 1;
    else
      v4 = 2;
    *((_BYTE *)self + 83) = *((_BYTE *)self + 83) & 0xF8 | v4;
  }
  return v2;
}

- (void)_noteIconDataSourceDidChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppClip");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEAC08], "appClips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __45__SBApplication__noteIconDataSourceDidChange__block_invoke;
    v25[3] = &unk_1E8EA1530;
    v25[4] = self;
    objc_msgSend(v5, "bs_filter:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        v13 = *MEMORY[0x1E0DAAA60];
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "bookmarkIconForWebClipIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "bookmark");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "postNotificationName:object:userInfo:", v13, v18, 0);

            }
            ++v14;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v11);
      }

      v6 = v19;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAAA60], self, 0);

  }
}

- (void)_setCurrentClassicMode:(int64_t)a3
{
  self->_currentClassicMode = a3;
}

- (void)setHasProminentlyIndicatedLocationUseWhileForeground:(BOOL)a3
{
  self->_hasProminentlyIndicatedLocationUseWhileForeground = a3;
}

- (BOOL)hasRegisteredBackgroundActivityWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_backgroundActivityAttributionsByIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)hasDisplayedLaunchAlertForType:(unint64_t)a3
{
  return (a3 & ~self->_displayedLaunchAlerts) == 0;
}

- (int)dataUsage
{
  if (self->_dataFlagsIsSet)
    return *((unsigned __int8 *)self + 84);
  else
    return -[SBApplicationInfo networkUsageTypes](self->_appInfo, "networkUsageTypes");
}

- (void)setShowsProgress:(BOOL)a3
{
  _BOOL4 v5;
  int showsProgressCount;
  int v7;
  id v8;

  v5 = -[SBApplication showsProgress](self, "showsProgress");
  showsProgressCount = self->_showsProgressCount;
  if (a3)
  {
    v7 = 1;
  }
  else
  {
    if (showsProgressCount < 1)
      goto LABEL_6;
    v7 = -1;
  }
  self->_showsProgressCount = showsProgressCount + v7;
LABEL_6:
  if (v5 != -[SBApplication showsProgress](self, "showsProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBApplicationShowsProgressChangedNotification"), self, 0);

  }
}

- (BOOL)showsProgress
{
  return self->_showsProgressCount > 0;
}

- (void)_updateProcess:(id)a3 withState:(id)a4
{
  FBApplicationProcess *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (FBApplicationProcess *)a3;
  v8 = a4;
  -[SBApplication _internalProcessState](self, "_internalProcessState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = -[SBApplicationProcessState _initWithProcess:stateSnapshot:]([SBApplicationProcessState alloc], "_initWithProcess:stateSnapshot:", v7, v8);
  else
    v10 = 0;
  if (self->_process != v7)
    objc_storeStrong((id *)&self->_process, a3);
  -[SBApplication _setInternalProcessState:](self, "_setInternalProcessState:", v10);
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Application process state changed for %{public}@: %{public}@", buf, 0x16u);

  }
  v13 = objc_msgSend(v9, "taskState");
  v14 = objc_msgSend(v8, "taskState");
  if (v13 != 3 && v14 == 3)
    -[SBApplication _didSuspend](self, "_didSuspend");
  if (v9)
  {
    v17 = CFSTR("previousProcessState");
    v18 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("SBApplicationProcessStateDidChange"), self, v15);

}

- (void)_setInternalProcessState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBApplication succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  return v3;
}

- (void)_didSuspend
{
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[SBApplication _didSuspend]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[SBApplication _resetDataUsage](self, "_resetDataUsage");
  if (-[NSString isEqual:](self->_bundleIdentifier, "isEqual:", CFSTR("com.apple.Preferences")))
  {
    v5 = _didSuspend_token;
    if (_didSuspend_token != -1
      || (notify_register_check("com.apple.airportsettingsvisible", &_didSuspend_token),
          v5 = _didSuspend_token,
          _didSuspend_token != -1))
    {
      notify_set_state(v5, 0);
      notify_post("com.apple.airportsettingsvisible");
    }
  }
}

- (void)_resetDataUsage
{
  self->_dataFlagsIsSet = 0;
}

- (BOOL)isUninstalled
{
  SBApplication *v2;
  BOOL uninstalled;

  v2 = self;
  objc_sync_enter(v2);
  uninstalled = v2->_uninstalled;
  objc_sync_exit(v2);

  return uninstalled;
}

- (BOOL)isUninstallSupported
{
  unint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = -[SBApplicationInfo uninstallCapability](self->_appInfo, "uninstallCapability");
  if (!v3 || v3 == 2 && !MGGetBoolAnswer())
    return 0;
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobileme.fmf1")))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47018]) == 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)restrictedToTheEmbeddedDisplayInChamois
{
  void *v3;
  void *v4;

  if (restrictedToTheEmbeddedDisplayInChamois_onceToken != -1)
    dispatch_once(&restrictedToTheEmbeddedDisplayInChamois_onceToken, &__block_literal_global_1_0);
  v3 = (void *)restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs;
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  return (char)v3;
}

- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSString *bundleIdentifier;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[SBApplication processState](self, "processState", a3, a4);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isRunning") & 1) != 0)
  {

  }
  else
  {
    v5 = -[SBApplicationInfo usesSplashBoard](self->_appInfo, "usesSplashBoard");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentTypeMask:", 6);
      objc_msgSend(v6, "_referenceBounds");
      objc_msgSend(v7, "setReferenceSize:", v8, v9);
      objc_msgSend(v6, "scale");
      objc_msgSend(v7, "setImageScale:");
      v10 = objc_msgSend((id)SBApp, "statusBarOrientationForEmbeddedDisplay");
      if (-[SBApplicationInfo supportsInterfaceOrientation:](self->_appInfo, "supportsInterfaceOrientation:", v10))
      {
        v11 = XBInterfaceOrientationMaskForInterfaceOrientationPair();
      }
      else if ((unint64_t)(v10 - 1) >= 2)
      {
        v11 = 2;
      }
      else
      {
        v11 = 24;
      }
      objc_msgSend(v7, "setInterfaceOrientationMask:", v11);
      -[SBApplication _snapshotManifestCreateIfNeeded:](self, "_snapshotManifestCreateIfNeeded:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultGroupIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "snapshotsForGroupID:matchingPredicate:", v13, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
LABEL_11:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
          objc_msgSend(v20, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
            if (v17)
              goto LABEL_11;
            goto LABEL_17;
          }
        }
        v22 = v20;

        if (v22)
          goto LABEL_22;
      }
      else
      {
LABEL_17:

      }
      SBLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = self->_bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v32 = bundleIdentifier;
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "No default launch images found for %@, pre-warming SplashBoard under the expectation it will be required.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DA8F50], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preheatServiceWithTimeout:", 2.0);

      v22 = 0;
LABEL_22:

    }
  }
}

- (id)_snapshotsWithImageName:(id)a3 sceneHandle:(id)a4 referenceSize:(CGSize)a5 requireExactSize:(BOOL)a6 launchingScale:(double)a7 contentTypeMask:(unint64_t)a8 statusBarStateMask:(unint64_t)a9 launchingOrientation:(int64_t)a10 contentOverridesContext:(id)a11 userInterfaceStyle:(int64_t)a12 displayEdgeInfo:(id)a13
{
  _BOOL4 v13;
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  char v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v102;
  void *v103;
  void *v104;
  _QWORD v105[2];
  _QWORD v106[4];

  v13 = a6;
  height = a5.height;
  width = a5.width;
  v106[2] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a11;
  v23 = a13;
  if (v21)
  {
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication+DefaultImage.m"), 174, CFSTR("Scene ID argument is required for getting a snapshot image."));

    if (!v13)
      goto LABEL_8;
  }
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication+DefaultImage.m"), 175, CFSTR("exact size match can't be zero"));

  }
LABEL_8:
  objc_msgSend(v21, "sceneIdentifier");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v103 = v22;
  -[SBApplication _defaultPNGNameUsingFallbacksWithSceneID:contentOverridesContext:](self, "_defaultPNGNameUsingFallbacksWithSceneID:contentOverridesContext:", v25, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication _normalizeSnapshotName:](self, "_normalizeSnapshotName:", v26);
  v27 = objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v27);
  else
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v20)
    objc_msgSend(v28, "addObject:", v20);
  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8F20], "fetchRequest");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v21;
  if (v30)
  {
    v95 = v29;
    objc_msgSend(v30, "defaultGroupIdentifier");
    v94 = objc_claimAutoreleasedReturnValue();
    v99 = (void *)MGCopyAnswer();
    if (v13)
      objc_msgSend(v31, "setReferenceSize:", width, height);
    v90 = v20;
    objc_msgSend(v31, "setContentTypeMask:", a8);
    objc_msgSend(v31, "setStatusBarStateMask:", a9);
    objc_msgSend(v31, "setRequiredOSVersion:", v99);
    objc_msgSend(v21, "application");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "info");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", a12);

    v85 = v34;
    objc_msgSend(v31, "setUserInterfaceStyle:", v34);
    objc_msgSend(v23, "safeAreaInsetsPortrait");
    v35 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)v35;
    v89 = v23;
    if (!v35)
    {
      v91 = 0;
      v86 = 1;
LABEL_27:
      objc_msgSend(v104, "setPredicate:", v31);
      objc_msgSend(v103, "activationSettings");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "effectiveStatusBarStyleRequestForActivation:", v54);
      v55 = objc_claimAutoreleasedReturnValue();

      v87 = (void *)v55;
      LODWORD(v55) = objc_msgSend((id)v55, "isDoubleHeight") & (a9 >> 2);
      if ((_DWORD)v55)
        v56 = 4;
      else
        v56 = a9 & 0xFFFFFFFFFFFFFFFBLL;
      objc_msgSend(v103, "url");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "scheme");
      v58 = objc_claimAutoreleasedReturnValue();

      v93 = (void *)v58;
      if (v27)
      {
        -[SBApplication info](self, "info");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v59, "usesSplashBoard"))
        {

        }
        else
        {

          if ((a8 & 4) != 0)
          {
            v84 = v55;
            objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
            v55 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v55, "setName:", v27);
            v106[0] = v25;
            v106[1] = v94;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "snapshotsForGroupIDs:matchingPredicate:", v60, v55);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v61, "count");

            if (!v83)
              -[SBApplication _ingestDefaultPNGsInManifest:withLaunchImageBaseName:](self, "_ingestDefaultPNGsInManifest:withLaunchImageBaseName:", v30, v27);

            v58 = (uint64_t)v93;
            LOBYTE(v55) = v84;
          }
        }
      }
      v49 = v30;
      v62 = (void *)objc_opt_class();
      objc_msgSend(v62, "snapshotSortDescriptorsForNames:scheme:imageScale:referenceSize:userInterfaceStyle:statusBarStateMask:interfaceOrientationMask:requiredOSVersion:", v95, v58, a12, v56, XBInterfaceOrientationMaskForInterfaceOrientationPair(), v99, a7, width, height);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setSortDescriptors:", v63);
      -[SBApplication info](self, "info");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "usesSplashBoard");

      if ((a8 & 2) != 0 && v65)
      {
        v66 = (void *)MEMORY[0x1E0DA8F10];
        -[SBApplication info](self, "info");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "compatibilityInfoForAppInfo:", v67);
        v68 = objc_claimAutoreleasedReturnValue();

        v97 = (void *)v68;
        if ((a8 & 1) != 0)
        {
          objc_msgSend(v103, "activationSettings");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v98, "isStatusBarHiddenForActivation:forOrientation:", v70, a10);

        }
        else
        {
          v69 = objc_msgSend(v98, "defaultStatusBarHiddenForOrientation:", a10);
        }
        v71 = 1;
        if ((v55 & 1) != 0)
          v71 = 2;
        if ((a9 & v69) != 0)
          v71 = 0;
        v102 = v71;
        v72 = objc_alloc_init(MEMORY[0x1E0DA8F58]);
        objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "sceneWithIdentifier:", v25);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "settings");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v75, "displayConfiguration");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v86 & 1) == 0)
          objc_msgSend(v72, "setCustomSafeAreaInsets:", v91);
        if (v76)
        {
          objc_msgSend(v72, "setDisplayConfiguration:", v76);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setDisplayConfiguration:", v77);

        }
        objc_msgSend(v72, "setGroupID:", v94, v83);
        objc_msgSend(v72, "setReferenceSize:", width, height);
        objc_msgSend(v72, "setStatusBarState:", v102);
        objc_msgSend(v72, "setInterfaceOrientation:", a10);
        objc_msgSend(v72, "setUrlSchemeName:", v93);
        objc_msgSend(v72, "setLaunchInterfaceIdentifier:", v27);
        objc_msgSend(v72, "setUserInterfaceStyle:", v85);
        v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8F28]), "initWithApplicationCompatibilityInfo:launchRequest:timeout:", v97, v72, 2.0);
        objc_msgSend(v104, "setFallbackGenerationContext:", v78);

      }
      v50 = (void *)v27;
      v51 = v94;
      v105[0] = v25;
      v105[1] = v94;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2, v83);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v104;
      objc_msgSend(v49, "snapshotsForGroupIDs:fetchRequest:", v79, v104);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v89;
      v20 = v90;
      v29 = v95;
      goto LABEL_53;
    }
    v36 = (void *)v35;
    v92 = v27;
    v37 = v25;
    v38 = objc_alloc(MEMORY[0x1E0DA8F48]);
    objc_msgSend(v36, "topInset");
    v40 = v39;
    objc_msgSend(v36, "leftInset");
    v42 = v41;
    objc_msgSend(v36, "bottomInset");
    v44 = v43;
    objc_msgSend(v36, "rightInset");
    v46 = (void *)objc_msgSend(v38, "initWithTop:left:bottom:right:", v40, v42, v44, v45);
    objc_msgSend((id)objc_opt_class(), "_deviceSafeAreaInsets");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqual:", v46);

    if (v48)
    {

    }
    else if (v46)
    {
      v91 = v46;
      objc_msgSend(v31, "setCustomSafeAreaInsets:", v46);
      v86 = 0;
LABEL_26:
      v25 = v37;
      v27 = v92;
      goto LABEL_27;
    }
    v91 = 0;
    v86 = 1;
    goto LABEL_26;
  }
  v49 = 0;
  v50 = (void *)v27;
  SBLogCommon();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    -[SBApplication(DefaultImage) _snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:].cold.1(self, v51);
  v52 = 0;
  v53 = v104;
LABEL_53:

  return v52;
}

- (id)_snapshotManifestCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  SBApplication *v4;
  uint64_t v5;
  XBApplicationSnapshotManifest *synchronized_snapshotManifest;
  XBApplicationSnapshotManifest *v7;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v3 && !v4->_synchronized_snapshotManifest && !v4->_uninstalled && v4->_appInfo)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8F30]), "initWithApplicationInfo:", v4->_appInfo);
    synchronized_snapshotManifest = v4->_synchronized_snapshotManifest;
    v4->_synchronized_snapshotManifest = (XBApplicationSnapshotManifest *)v5;

    -[XBApplicationSnapshotManifest setDelegate:](v4->_synchronized_snapshotManifest, "setDelegate:", v4);
  }
  v7 = v4->_synchronized_snapshotManifest;
  objc_sync_exit(v4);

  return v7;
}

- (id)_normalizeSnapshotName:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DA8F18], "normalizeSnapshotName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBApplication info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "usesSplashBoard");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0DA8F10];
      -[SBApplication info](self, "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "compatibilityInfoForAppInfo:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "defaultLaunchInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "isEqualToString:", v4))
      {
LABEL_8:

        goto LABEL_9;
      }

    }
    else
    {
      -[SBApplication _defaultLaunchImageBaseName](self, "_defaultLaunchImageBaseName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToString:", v4))
      {
LABEL_9:

        return v4;
      }
      v11 = v4;
    }
    v4 = 0;
    goto LABEL_8;
  }
  return v4;
}

- (id)_snapshotManifest
{
  return -[SBApplication _snapshotManifestCreateIfNeeded:](self, "_snapshotManifestCreateIfNeeded:", 1);
}

+ (id)snapshotSortDescriptorsForNames:(id)a3 scheme:(id)a4 imageScale:(double)a5 referenceSize:(CGSize)a6 userInterfaceStyle:(int64_t)a7 statusBarStateMask:(unint64_t)a8 interfaceOrientationMask:(unint64_t)a9 requiredOSVersion:(id)a10
{
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  height = a6.height;
  width = a6.width;
  v19 = a10;
  v20 = a4;
  v21 = a3;
  objc_msgSend(a1, "snapshotSortDescriptorForNames:", v21);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForScheme:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "snapshotSortDescriptorForInterfaceOrientationMask:", a9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForStatusBarStateMask:", a8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForImageScale:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForReferenceSize:", width, height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForContentTypeMask");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForRequiredOSVersion:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "snapshotSortDescriptorPreferringProtectedContent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForCreationDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotSortDescriptorForUIUserInterfaceStyle:", a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = objc_msgSend(v21, "count");

  if (v20 != 0 && v28 == 0)
    v29 = v22;
  else
    v29 = v37;
  if (v20 != 0 && v28 == 0)
    v30 = v37;
  else
    v30 = v22;
  objc_msgSend(v27, "addObject:", v29);
  objc_msgSend(v27, "addObject:", v30);
  objc_msgSend(v27, "addObject:", v33);
  objc_msgSend(v27, "addObject:", v26);
  objc_msgSend(v27, "addObject:", v34);
  objc_msgSend(v27, "addObject:", v24);
  objc_msgSend(v27, "addObject:", v23);
  objc_msgSend(v27, "addObject:", v35);
  objc_msgSend(v27, "addObject:", v25);
  objc_msgSend(v27, "addObject:", v32);
  objc_msgSend(v27, "addObject:", v36);

  return v27;
}

+ (id)snapshotSortDescriptorPreferringProtectedContent
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 11, 1, &__block_literal_global_138);
}

+ (id)snapshotSortDescriptorForUIUserInterfaceStyle:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForUIUserInterfaceStyle___block_invoke;
  v4[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 12, 1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)snapshotSortDescriptorForStatusBarStateMask:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SBApplication_SnapshotSorting__snapshotSortDescriptorForStatusBarStateMask___block_invoke;
  v4[3] = &__block_descriptor_40_e53_q24__0__XBStatusBarSettings_8__XBStatusBarSettings_16l;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 8, 1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)snapshotSortDescriptorForScheme:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DA8F40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SBApplication_SnapshotSorting__snapshotSortDescriptorForScheme___block_invoke;
  v8[3] = &unk_1E8EAC928;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", 2, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)snapshotSortDescriptorForRequiredOSVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DA8F40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SBApplication_SnapshotSorting__snapshotSortDescriptorForRequiredOSVersion___block_invoke;
  v8[3] = &unk_1E8EAC928;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", 9, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)snapshotSortDescriptorForReferenceSize:(CGSize)a3
{
  _QWORD v4[4];
  CGSize v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__SBApplication_SnapshotSorting__snapshotSortDescriptorForReferenceSize___block_invoke;
  v4[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 5, 1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)snapshotSortDescriptorForNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DA8F40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBApplication_SnapshotSorting__snapshotSortDescriptorForNames___block_invoke;
  v8[3] = &unk_1E8EAC928;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", 1, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)snapshotSortDescriptorForInterfaceOrientationMask:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__SBApplication_SnapshotSorting__snapshotSortDescriptorForInterfaceOrientationMask___block_invoke;
  v4[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 4, 1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)snapshotSortDescriptorForImageScale:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SBApplication_SnapshotSorting__snapshotSortDescriptorForImageScale___block_invoke;
  v4[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  *(double *)&v4[4] = a3;
  objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 6, 1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)snapshotSortDescriptorForCreationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 10, 1, &__block_literal_global_9_2);
}

+ (id)snapshotSortDescriptorForContentTypeMask
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8F40], "sortDescriptorWithKey:ascending:comparator:", 7, 1, &__block_literal_global_7);
}

+ (id)_deviceSafeAreaInsets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  v2 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
  if (!_deviceSafeAreaInsets_deviceSafeAreaInsets)
  {
    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsetsPortrait");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0DA8F48]);
    objc_msgSend(v4, "topInset");
    v7 = v6;
    objc_msgSend(v4, "leftInset");
    v9 = v8;
    objc_msgSend(v4, "bottomInset");
    v11 = v10;
    objc_msgSend(v4, "rightInset");
    v13 = objc_msgSend(v5, "initWithTop:left:bottom:right:", v7, v9, v11, v12);
    v14 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
    _deviceSafeAreaInsets_deviceSafeAreaInsets = v13;

    v2 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
  }
  return v2;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  SBActivationSettings *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SBActivationSettings *v19;
  SBActivationSettings *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!v11)
      goto LABEL_13;
    v15 = objc_alloc_init(SBActivationSettings);
    objc_msgSend(v11, "_sbWindowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBApplication restrictedToTheEmbeddedDisplayInChamois](self, "restrictedToTheEmbeddedDisplayInChamois")
      && objc_msgSend(v16, "isExtendedDisplayWindowScene"))
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "embeddedDisplayWindowScene");
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v18;
    }
    -[SBActivationSettings setObject:forActivationSetting:](v15, "setObject:forActivationSetting:", v16, 68);

    if (!v15)
      goto LABEL_13;
LABEL_12:
    v19 = v15;
    v20 = v19;
    goto LABEL_14;
  }
  objc_msgSend(v10, "activationSettings");
  v15 = (SBActivationSettings *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_12;
LABEL_13:
  v19 = objc_alloc_init(SBActivationSettings);
  v20 = 0;
LABEL_14:
  SBLogIcon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v22;
    v27 = 2112;
    v28 = v8;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Launching application %@ from icon %@, location: %{public}@", (uint8_t *)&v25, 0x20u);

  }
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateApplication:fromIcon:location:activationSettings:actions:", self, v8, v9, v19, v12);

  return 1;
}

- (unint64_t)supportedSizingPoliciesForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6
{
  int v10;
  char v11;
  BOOL v13;

  v10 = objc_msgSend(a4, "isExternal");
  v11 = v10;
  if (a3 == 2)
  {
    if (-[SBApplication alwaysMaximizedInChamois](self, "alwaysMaximizedInChamois"))
    {
      return 4;
    }
    else
    {
      if (-[SBApplication supportsChamoisSceneResizing](self, "supportsChamoisSceneResizing"))
        return 5;
      if ((v11 & 1) == 0
        && (v13 = -[SBApplication classicAppFullScreen](self, "classicAppFullScreen"), a5 == a6)
        && v13)
      {
        return 5;
      }
      else
      {
        return 3;
      }
    }
  }
  else if (a3 == 1)
  {
    if ((-[SBApplication isMedusaCapable](self, "isMedusaCapable") & (v10 ^ 1)) != 0)
      return 5;
    else
      return 4;
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (int64_t)preferredSizingPolicyForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6
{
  char v10;
  char v12;
  BOOL v13;

  v10 = objc_msgSend(a4, "isExternal");
  if (a3 < 2)
    return 2;
  if (a3 != 2)
    return 0;
  v12 = v10;
  if (-[SBApplication alwaysMaximizedInChamois](self, "alwaysMaximizedInChamois"))
    return 2;
  if (-[SBApplication supportsChamoisSceneResizing](self, "supportsChamoisSceneResizing"))
    return 0;
  if ((v12 & 1) == 0)
  {
    v13 = -[SBApplication classicAppFullScreen](self, "classicAppFullScreen");
    if (a5 == a6 && v13)
      return 2;
  }
  return 1;
}

- (BOOL)supportsChamoisOnExternalDisplay
{
  return -[SBApplicationInfo isSydneyLinked](self->_appInfo, "isSydneyLinked")
      || -[SBApplication supportsChamoisSceneResizing](self, "supportsChamoisSceneResizing");
}

- (id)_defaultPNGNameUsingFallbacksWithSceneID:(id)a3 contentOverridesContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "requestedLaunchIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[SBApplication info](self, "info"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "prefersSavedSnapshots"),
        v8,
        !v9))
  {
    v11 = CFSTR("fallbacks for scene id");
  }
  else
  {
    -[SBApplication _defaultPNGNameFromSuspensionSettingsWithExpiration:sceneID:](self, "_defaultPNGNameFromSuspensionSettingsWithExpiration:sceneID:", 0, v6);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v11 = CFSTR("suspension settings");
    v7 = (void *)v10;
  }
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v13;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "[defaultImage] <%{public}@> default image name %{public}@ calculated from %{public}@", (uint8_t *)&v15, 0x20u);

  }
LABEL_10:

  return v7;
}

- (id)bestSnapshotWithImageName:(id)a3 sceneHandle:(id)a4 variantID:(id)a5 scale:(double)a6 referenceSize:(CGSize)a7 requireExactSize:(BOOL)a8 contentTypeMask:(unint64_t)a9 statusBarStateMask:(unint64_t)a10 launchingOrientation:(int64_t)a11 contentOverridesContext:(id)a12 userInterfaceStyle:(int64_t)a13 displayEdgeInfo:(id)a14
{
  _BOOL8 v15;
  double height;
  double width;
  id v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (**v31)(_QWORD, _QWORD);
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  void *v39;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[7];
  BOOL v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v15 = a8;
  height = a7.height;
  width = a7.width;
  v53 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  v24 = a5;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    SBLogCommon();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "sceneIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v22;
      v51 = 2114;
      v52 = v39;
      v26 = v22;
      _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "A snapshot was requested with an empty reference size for name: <%{public}@> in scene <%{public}@>.", buf, 0x16u);

      v38 = 0;
    }
    else
    {
      v38 = 0;
      v26 = v22;
    }
  }
  else
  {
    v26 = v22;
    -[SBApplication _snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:](self, "_snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", v22, v23, v15, a9, a10, a11, width, height, a6, a12, a13, a14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "snapshotAspectRatioAcceptanceThreshold");
    v30 = v29;

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __231__SBApplication_DefaultImage__bestSnapshotWithImageName_sceneHandle_variantID_scale_referenceSize_requireExactSize_contentTypeMask_statusBarStateMask_launchingOrientation_contentOverridesContext_userInterfaceStyle_displayEdgeInfo___block_invoke;
    v46[3] = &__block_descriptor_57_e31_B16__0__XBApplicationSnapshot_8l;
    v47 = v15;
    *(double *)&v46[4] = width;
    *(double *)&v46[5] = height;
    v46[6] = v30;
    v31 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v46);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = v27;
    v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (v24)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "variantWithIdentifier:", v24);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            if (v38 && (((uint64_t (**)(_QWORD, id))v31)[2](v31, v38) & 1) != 0)
              goto LABEL_22;

          }
          if (((uint64_t (**)(_QWORD, void *))v31)[2](v31, v37))
          {
            v38 = v37;
            goto LABEL_22;
          }
        }
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v34)
          continue;
        break;
      }
    }
    v38 = 0;
LABEL_22:

  }
  return v38;
}

BOOL __231__SBApplication_DefaultImage__bestSnapshotWithImageName_sceneHandle_variantID_scale_referenceSize_requireExactSize_contentTypeMask_statusBarStateMask_launchingOrientation_contentOverridesContext_userInterfaceStyle_displayEdgeInfo___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "isValid");

    return v6;
  }
  else
  {
    objc_msgSend(v4, "referenceSize");
    v9 = v8;
    v11 = v10;
    v12 = *(double *)(a1 + 32);
    v13 = *(double *)(a1 + 40);
    v14 = objc_msgSend(v5, "isValid");

    return v14 && vabdd_f64(v9 / v11, v12 / v13) <= *(double *)(a1 + 48);
  }
}

- (BOOL)classicAppWithRoundedCorners
{
  return SBApplicationClassicModeExpectsRoundedCorners(-[SBApplication _classicMode](self, "_classicMode"));
}

+ (unint64_t)_niceScreenTypeForClassicType:(unint64_t)a3 matchingAValidDisplayZoomModeOnScreenType:(unint64_t)a4
{
  int HasHomeButton;
  unint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = a3;
  SBHGetScreenSpecification();
  SBHGetScreenSpecification();
  HasHomeButton = SBHScreenTypeHasHomeButton();
  if (HasHomeButton == SBHScreenTypeHasHomeButton())
    SBHEnumerateScreenTypes();
  v6 = +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)a1, v9[3]);
  v9[3] = v6;
  _Block_object_dispose(&v8, 8);
  return v6;
}

+ (unint64_t)_canonicalScreenTypeForClassicMode:(int64_t)a3
{
  unint64_t result;

  result = 0;
  switch(a3)
  {
    case -1:
      result = 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 0:
      result = SBHScreenTypeForCurrentDevice();
      break;
    case 3:
      result = 1;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 4;
      break;
    case 6:
      result = 3;
      break;
    case 7:
      result = 11;
      break;
    case 8:
      result = 21;
      break;
    case 9:
      result = 5;
      break;
    case 10:
      result = 13;
      break;
    case 11:
      result = 23;
      break;
    case 12:
      result = 29;
      break;
    case 13:
      result = 32;
      break;
    case 14:
      result = 33;
      break;
    case 15:
      result = 41;
      break;
    case 16:
      result = 36;
      break;
    case 17:
      result = 38;
      break;
    case 18:
      result = 43;
      break;
    case 19:
      result = 39;
      break;
    case 20:
      result = 40;
      break;
    case 21:
      result = 45;
      break;
    case 22:
      result = 42;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)KJHKJHw39rq9w87q903475q0983rskjd
{
  if (KJHKJHw39rq9w87q903475q0983rskjd_onceToken != -1)
    dispatch_once(&KJHKJHw39rq9w87q903475q0983rskjd_onceToken, &__block_literal_global_3);
  return KJHKJHw39rq9w87q903475q0983rskjd_sRelaxable;
}

- (BOOL)classicAppRequiresHiDPI
{
  _BOOL4 v3;

  v3 = -[SBApplication isClassic](self, "isClassic");
  if (v3)
    LOBYTE(v3) = -[SBApplicationInfo requiresHiDPI](self->_appInfo, "requiresHiDPI");
  return v3;
}

- (BOOL)isSameExecutableAsApplication:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasProminentlyIndicatedLocationUseWhileForeground
{
  return self->_hasProminentlyIndicatedLocationUseWhileForeground;
}

- (void)setNowRecordingApplication:(BOOL)a3
{
  if (self->_isNowRecordingApplication != a3)
  {
    self->_isNowRecordingApplication = a3;
    -[FBApplicationProcess setRecordingAudio:](self->_process, "setRecordingAudio:");
  }
}

- (BOOL)_canLaunchInClassicMode:(int64_t)a3
{
  void *v3;
  void *v4;
  SBApplication *v6;
  int v7;
  char v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  char v15;
  int v16;
  SBApplication *v17;
  uint64_t v18;
  int v19;
  char v20;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  SBApplication *v32;
  uint64_t v33;
  void *v34;

  v6 = self;
  -[SBApplication _calculateSupportedTypesLazilyIfNecessary](self, "_calculateSupportedTypesLazilyIfNecessary");
  if (-[SBApplication _bypassesClassicMode]((uint64_t)v6))
  {
    LOBYTE(v6) = a3 != -1;
    return (char)v6;
  }
  switch(a3)
  {
    case 0:
      v18 = -[SBApplication _supportedTypeForClassicModeNone](v6, "_supportedTypeForClassicModeNone");
      v17 = v6;
      return -[SBApplication _supportsApplicationType:](v17, "_supportsApplicationType:", v18);
    case 1:
      v17 = v6;
      v18 = 1;
      return -[SBApplication _supportsApplicationType:](v17, "_supportsApplicationType:", v18);
    case 2:
      v10 = __sb__runningInSpringBoard();
      v8 = v10;
      if (v10)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 4;
      goto LABEL_112;
    case 3:
      v22 = __sb__runningInSpringBoard();
      v8 = v22;
      if (v22)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 8;
      goto LABEL_112;
    case 4:
      v11 = __sb__runningInSpringBoard();
      v8 = v11;
      if (v11)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 16;
      goto LABEL_112;
    case 5:
      v23 = __sb__runningInSpringBoard();
      v8 = v23;
      if (v23)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 32;
      goto LABEL_112;
    case 6:
      v24 = __sb__runningInSpringBoard();
      v8 = v24;
      if (v24)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 64;
      goto LABEL_112;
    case 7:
      v25 = __sb__runningInSpringBoard();
      v8 = v25;
      if (v25)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 128;
      goto LABEL_112;
    case 8:
      v26 = __sb__runningInSpringBoard();
      v8 = v26;
      if (v26)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 256;
      goto LABEL_112;
    case 9:
      v12 = __sb__runningInSpringBoard();
      v8 = v12;
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 1024;
      goto LABEL_112;
    case 10:
      v27 = __sb__runningInSpringBoard();
      v8 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 2048;
      goto LABEL_112;
    case 11:
      v13 = __sb__runningInSpringBoard();
      v8 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 4096;
      goto LABEL_112;
    case 12:
      if (!-[SBApplication _supportsApplicationType:](v6, "_supportsApplicationType:", 2))
        goto LABEL_24;
      v14 = __sb__runningInSpringBoard();
      v15 = v14;
      if (v14)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      LODWORD(v6) = BSSizeEqualToSize() ^ 1;
      if ((v15 & 1) != 0)
        return (char)v6;
      goto LABEL_116;
    case 13:
      v28 = __sb__runningInSpringBoard();
      v8 = v28;
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (BSSizeLessThanSize())
        goto LABEL_102;
      goto LABEL_114;
    case 14:
      v16 = __sb__runningInSpringBoard();
      v8 = v16;
      if (v16)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize())
        goto LABEL_114;
LABEL_102:
      v32 = v6;
      v33 = 0x8000000;
      goto LABEL_112;
    case 15:
      if (!__sb__runningInSpringBoard())
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v34, "userInterfaceIdiom") == 1
                  && -[SBApplication _supportsApplicationType:](v6, "_supportsApplicationType:", 0x20000);

        return (char)v6;
      }
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_24:
        LOBYTE(v6) = 0;
        return (char)v6;
      }
      v17 = v6;
      v18 = 0x20000;
      return -[SBApplication _supportsApplicationType:](v17, "_supportsApplicationType:", v18);
    case 16:
    case 17:
      v7 = __sb__runningInSpringBoard();
      v8 = v7;
      if (v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (BSSizeEqualToSize()
        && -[SBApplication _supportsApplicationType:](v6, "_supportsApplicationType:", 0x10000))
      {
        LOBYTE(v6) = 1;
        if ((v8 & 1) == 0)
          goto LABEL_116;
        return (char)v6;
      }
      v19 = __sb__runningInSpringBoard();
      v20 = v19;
      if (v19)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (BSSizeLessThanSize())
      {
        LOBYTE(v6) = -[SBApplication _supportsApplicationType:](v6, "_supportsApplicationType:", 0x100000);
        if ((v20 & 1) != 0)
          goto LABEL_115;
      }
      else
      {
        LOBYTE(v6) = 0;
        if ((v20 & 1) != 0)
          goto LABEL_115;
      }

      if ((v8 & 1) != 0)
        return (char)v6;
      goto LABEL_116;
    case 18:
      v29 = __sb__runningInSpringBoard();
      v8 = v29;
      if (v29)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 0x2000000;
      goto LABEL_112;
    case 19:
    case 22:
      v9 = __sb__runningInSpringBoard();
      v8 = v9;
      if (v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 0x1000000;
      goto LABEL_112;
    case 20:
      v30 = __sb__runningInSpringBoard();
      v8 = v30;
      if (v30)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize())
        goto LABEL_114;
      v32 = v6;
      v33 = 0x10000000;
      goto LABEL_112;
    case 21:
      v31 = __sb__runningInSpringBoard();
      v8 = v31;
      if (v31)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if (BSSizeGreaterThanOrEqualToSize())
      {
        v32 = v6;
        v33 = 0x40000000;
LABEL_112:
        LOBYTE(v6) = -[SBApplication _supportsApplicationType:](v32, "_supportsApplicationType:", v33);
        if ((v8 & 1) != 0)
          return (char)v6;
LABEL_116:

        return (char)v6;
      }
LABEL_114:
      LOBYTE(v6) = 0;
LABEL_115:
      if ((v8 & 1) == 0)
        goto LABEL_116;
      return (char)v6;
    default:
      goto LABEL_24;
  }
}

- (void)_processDidLaunch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWorkspace();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SBApplication _processDidLaunch:]";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v4, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication _updateProcess:withState:](self, "_updateProcess:withState:", v4, v7);

  objc_msgSend(v4, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("CLASSIC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_currentClassicMode = objc_msgSend(v10, "integerValue");

}

- (void)_processWillLaunch:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication.m"), 839, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

  }
  SBLogWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[SBApplication _processWillLaunch:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);

  }
  objc_msgSend(v5, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication _updateProcess:withState:](self, "_updateProcess:withState:", v5, v8);

  -[SBApplication _setNewlyInstalled:](self, "_setNewlyInstalled:", 0);
  -[SBApplication _setRecentlyUpdated:](self, "_setRecentlyUpdated:", 0);
  v9 = -[SBApplication _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:](self, "_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:", 0);
  objc_msgSend(v5, "executionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("CLASSIC_OVERRIDE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_currentClassicMode = objc_msgSend(v12, "integerValue");

}

- (id)_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:(id)a3
{
  id v4;
  SBApplication *v5;
  SBApplicationSupportServiceRequestContext *initializationContext;
  SBApplicationSupportServiceRequestContext *v7;
  SBApplicationSupportServiceRequestContext *v8;
  SBApplicationSupportServiceRequestContext *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  initializationContext = v5->_initializationContext;
  if (!initializationContext)
  {
    v7 = -[SBApplicationSupportServiceRequestContext initWithApplication:launchDisplayConfiguration:]([SBApplicationSupportServiceRequestContext alloc], "initWithApplication:launchDisplayConfiguration:", v5, v4);
    v8 = v5->_initializationContext;
    v5->_initializationContext = v7;

    initializationContext = v5->_initializationContext;
  }
  v9 = initializationContext;
  objc_sync_exit(v5);

  -[SBApplicationSupportServiceRequestContext applicationInitializationContextWithCompletion:](v9, "applicationInitializationContextWithCompletion:", &__block_literal_global_18);
  return v9;
}

- (void)_setNewlyInstalled:(BOOL)a3
{
  _BOOL8 v3;
  FBSApplicationDataStore *dataStore;
  void *v6;
  char v7;

  v3 = a3;
  if (-[SBApplication _isNewlyInstalled](self, "_isNewlyInstalled") != a3)
  {
    dataStore = self->_dataStore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:", v6, CFSTR("SBApplicationIsNewlyInstalled"));

    if (v3)
      v7 = 8;
    else
      v7 = 16;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xC7 | v7;
    -[SBApplication _noteIconDataSourceDidChange](self, "_noteIconDataSourceDidChange");
  }
}

- (BOOL)isSpotlight
{
  void *v2;
  char v3;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v3;
}

- (BOOL)isPaperBoard
{
  void *v2;
  char v3;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PaperBoard"));

  return v3;
}

- (id)backgroundActivityAttributionsByIdentifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_backgroundActivityAttributionsByIdentifier;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_backgroundActivityAttributionsByIdentifier, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v9, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKey:", v12, v8);
      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_noteProcess:(id)a3 didChangeToState:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isRunning"))
    -[SBApplication _updateProcess:withState:](self, "_updateProcess:withState:", v7, v6);

}

uint64_t __84__SBApplication_SnapshotSorting__snapshotSortDescriptorForInterfaceOrientationMask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  v8 = *(_QWORD *)(a1 + 32);
  v9 = v8 & v6;
  v10 = v8 & v7;
  v11 = v8 & v6 | v8 & v7;
  if ((v6 & 2) != 0)
    v12 = -1;
  else
    v12 = 1;
  if ((unint64_t)(v6 & 2) >> 1 != ((v7 >> 1) & 1))
    v13 = v12;
  else
    v13 = 0;
  if (((v6 | v7) & 2) != 0)
    v14 = v13;
  else
    v14 = 0;
  if ((v8 & 2) != 0)
    v15 = 0;
  else
    v15 = v14;
  v16 = v9 == 0;
  v17 = (v9 != 0) ^ (v10 != 0);
  if (v16)
    v18 = 1;
  else
    v18 = -1;
  if (v17)
    v19 = v18;
  else
    v19 = 0;
  if (v11)
    return v19;
  else
    return v15;
}

- (CGRect)snapshotFrameForClassicInsideBounds:(CGRect)a3 forOrientation:(int64_t)a4 scaleFactor:(CGSize *)a5 inReferenceSpace:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat rect;
  CGFloat v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect result;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = 1.0;
  if (!-[SBApplication isClassic](self, "isClassic"))
  {
    v25 = 1.0;
    if (!a5)
      goto LABEL_39;
    goto LABEL_38;
  }
  v55 = y;
  rect = height;
  v15 = -[SBApplication classicAppScaled](self, "classicAppScaled");
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication defaultLaunchingSizeForDisplayConfiguration:](self, "defaultLaunchingSizeForDisplayConfiguration:", v16);
  BSRectWithSize();
  v52 = v17;
  v58 = v18;
  v20 = v19;
  v22 = v21;

  v56 = width;
  if (-[SBApplication classicAppPhoneAppRunningOnPad](self, "classicAppPhoneAppRunningOnPad"))
  {
    v23 = -[SBApplication classicAppZoomedInOrRequiresHiDPI](self, "classicAppZoomedInOrRequiresHiDPI");
    v24 = 1.0;
    v25 = 1.0;
    if (v23)
    {
      v24 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(a4, v20, v22);
      v25 = v24;
    }
  }
  else
  {
    v24 = 1.0;
    v25 = 1.0;
    if (v15)
    {
      if (-[SBApplication classicAppFullScreen](self, "classicAppFullScreen"))
        v26 = !-[SBApplication classicAppWithRoundedCorners](self, "classicAppWithRoundedCorners");
      else
        v26 = 1;
      v59.origin.x = x;
      v59.origin.y = v55;
      v59.size.width = width;
      v59.size.height = rect;
      v50 = x;
      v27 = CGRectGetHeight(v59);
      v60.origin.x = v52;
      v60.origin.y = v58;
      v60.size.width = v20;
      v60.size.height = v22;
      v53 = v27 / CGRectGetHeight(v60);
      x = v50;
      v61.origin.x = v50;
      v61.origin.y = v55;
      v61.size.width = width;
      v61.size.height = rect;
      v28 = CGRectGetWidth(v61);
      v62.origin.x = v52;
      v62.origin.y = v58;
      v62.size.width = v20;
      v62.size.height = v22;
      v29 = CGRectGetWidth(v62);
      v25 = v28 / v29;
      if (v26)
      {
        v24 = v53;
        if (v25 <= v53)
          v24 = v28 / v29;
        v25 = v24;
      }
      else
      {
        v24 = v53;
      }
    }
  }
  v30 = a4 - 3;
  if (v6)
    v31 = v20;
  else
    v31 = v22;
  if (v6)
    v32 = v22;
  else
    v32 = v20;
  if (v30 >= 2)
    v33 = v20;
  else
    v33 = v31;
  if (v30 < 2)
    v22 = v32;
  v34 = v24;
  v54 = v24;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    v63.origin.x = v52;
    v63.origin.y = v58;
    v63.size.width = v33;
    v63.size.height = v22;
    v35 = CGRectGetWidth(v63);
    v64.size.height = v22;
    v36 = round(v25 * v35);
    v64.origin.x = v52;
    v64.origin.y = v58;
    v64.size.width = v36;
    v48 = round(v34 * CGRectGetHeight(v64));
    v65.origin.x = x;
    v65.origin.y = v55;
    v65.size.width = v56;
    v65.size.height = rect;
    v51 = CGRectGetWidth(v65);
    v66.origin.x = v52;
    v66.origin.y = v58;
    v66.size.width = v36;
    v66.size.height = v48;
    v49 = v51 - CGRectGetWidth(v66);
    v67.origin.x = x;
    v67.origin.y = v55;
    v67.size.width = v56;
    v67.size.height = rect;
    v37 = CGRectGetHeight(v67);
    v68.origin.x = v52;
    v68.origin.y = v58;
    v68.size.width = v36;
    v68.size.height = v48;
    v38 = CGRectGetHeight(v68);
    if (v49 > 1.0 || v49 <= 0.0)
    {
      v39 = v37 - v38;
      if (v39 > 1.0 || v39 <= 0.0)
      {
        if (-[SBApplication classicAppFullScreen](self, "classicAppFullScreen")
          && -[SBApplication classicAppWithRoundedCorners](self, "classicAppWithRoundedCorners"))
        {
          v71.origin.x = x;
          v71.origin.y = v55;
          v71.size.width = v56;
          v71.size.height = rect;
          CGRectGetWidth(v71);
          v72.origin.x = x;
          v72.origin.y = v55;
          v72.size.width = v56;
          v72.size.height = rect;
          CGRectGetHeight(v72);
        }
      }
      else
      {
        v70.origin.x = x;
        v70.origin.y = v55;
        v70.size.width = v56;
        v70.size.height = rect;
        CGRectGetHeight(v70);
      }
    }
    else
    {
      v69.origin.x = x;
      v69.origin.y = v55;
      v69.size.width = v56;
      v69.size.height = rect;
      CGRectGetWidth(v69);
    }
  }
  UIRectCenteredIntegralRect();
  x = v40;
  y = v41;
  width = v42;
  height = v43;
  v14 = v54;
  if (a5)
  {
LABEL_38:
    a5->width = v25;
    a5->height = v14;
  }
LABEL_39:
  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (CGSize)defaultLaunchingSizeForDisplayConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v4, -[SBApplication _classicMode](self, "_classicMode"));
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)_defaultLaunchingSizeForClassicMode:(int64_t)a3
{
  __int128 v3;
  __int128 *v4;
  double v5;
  CGSize result;

  switch(a3)
  {
    case -1:
    case 0:
      v4 = (__int128 *)MEMORY[0x1E0C9D820];
      goto LABEL_4;
    case 1:
      v4 = (__int128 *)MEMORY[0x1E0DAB260];
LABEL_4:
      v3 = *v4;
      break;
    case 2:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 16);
      break;
    case 3:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 32);
      break;
    case 4:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 48);
      break;
    case 5:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
      break;
    case 6:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
      break;
    case 7:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 96);
      break;
    case 8:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 144);
      break;
    case 9:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 112);
      break;
    case 10:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 128);
      break;
    case 11:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 160);
      break;
    case 12:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 208);
      break;
    case 13:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 240);
      break;
    case 14:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 256);
      break;
    case 15:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 288);
      break;
    case 16:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 320);
      break;
    case 17:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 352);
      break;
    case 18:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 384);
      break;
    case 19:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 368);
      break;
    case 20:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 416);
      break;
    case 21:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 448);
      break;
    case 22:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 432);
      break;
    default:
      break;
  }
  v5 = *((double *)&v3 + 1);
  result.width = *(double *)&v3;
  result.height = v5;
  return result;
}

- (BOOL)classicAppZoomedInOrRequiresHiDPI
{
  return -[SBApplication classicAppZoomedIn](self, "classicAppZoomedIn")
      || -[SBApplication classicAppRequiresHiDPI](self, "classicAppRequiresHiDPI");
}

- (BOOL)classicAppZoomedIn
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[SBApplication _classicAppScaledPhoneOnPad](self, "_classicAppScaledPhoneOnPad")
    || -[SBApplicationInfo requiresHiDPI](self->_appInfo, "requiresHiDPI"))
  {
    return 0;
  }
  -[SBApplication _dataStore](self, "_dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication _baseSceneIdentifier](self, "_baseSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneStoreForIdentifier:creatingIfNecessary:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeObjectForKey:ofType:", CFSTR("classicAppZoomedIn"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");

  return (char)v4;
}

uint64_t __78__SBApplication_SnapshotSorting__snapshotSortDescriptorForStatusBarStateMask___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;

  v3 = a3;
  v4 = XBStatusBarStateMaskMatchesSettings();
  v5 = XBStatusBarStateMaskMatchesSettings();

  v6 = -1;
  if (!v4)
    v6 = 1;
  if (((v4 | v5) & (v4 ^ v5)) != 0)
    return v6;
  else
    return 0;
}

uint64_t __74__SBApplication_SnapshotSorting__snapshotSortDescriptorForContentTypeMask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __73__SBApplication_SnapshotSorting__snapshotSortDescriptorForReferenceSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "CGSizeValue");
  objc_msgSend(v4, "CGSizeValue");

  return BSCompareFloats();
}

uint64_t __71__SBApplication_SnapshotSorting__snapshotSortDescriptorForCreationDate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __65__SBApplication_SnapshotSorting__snapshotSortDescriptorForNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompareWithSet(a2, a3, *(void **)(a1 + 32));
}

- (BOOL)classicAppWithOwnSafeArea
{
  return SBFEffectiveHomeButtonType() == 2
      && SBApplicationClassicModeWantsSafeAreaInsets(-[SBApplication _classicMode](self, "_classicMode"));
}

- (void)_setClassicAppZoomedIn:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[SBApplication _classicAppScaledPhoneOnPad](self, "_classicAppScaledPhoneOnPad"))
  {
    if (!-[SBApplicationInfo requiresHiDPI](self->_appInfo, "requiresHiDPI"))
    {
      -[SBApplication _dataStore](self, "_dataStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplication _baseSceneIdentifier](self, "_baseSceneIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("classicAppZoomedIn"));

    }
  }
}

- (void)_recalculateApplicationSupportedTypes
{
  self->_calculatedSupportedTypes = 0;
  self->_supportedTypes &= 3uLL;
  -[SBApplication _calculateSupportedTypesLazilyIfNecessary](self, "_calculateSupportedTypesLazilyIfNecessary");
}

+ (int64_t)_bestAvailableClassicModeForHostingExtensionContainedInApplication:(BOOL)a3
{
  _BOOL4 v3;
  int64_t *v4;
  _QWORD block[5];

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bestAvailableClassicModeForHostingExtensionContainedInApplication__onceToken != -1)
    dispatch_once(&_bestAvailableClassicModeForHostingExtensionContainedInApplication__onceToken, block);
  v4 = &_bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePad;
  if (!v3)
    v4 = &_bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePhone;
  return *v4;
}

void __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  _OWORD v26[15];
  _OWORD v27[11];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0DAB260];
  v2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 48);
  v27[1] = *(_OWORD *)(MEMORY[0x1E0DAB260] + 16);
  v27[2] = v2;
  v4 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
  v5 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
  v27[3] = v3;
  v27[4] = v4;
  v6 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 96);
  v7 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 112);
  v27[5] = v5;
  v27[6] = v6;
  v8 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 128);
  v27[7] = *(_OWORD *)(MEMORY[0x1E0DAB260] + 144);
  v27[8] = v7;
  v9 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 160);
  v27[9] = v8;
  v27[10] = v9;
  v11 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 256);
  v10 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 272);
  v12 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 224);
  v26[0] = *(_OWORD *)(MEMORY[0x1E0DAB260] + 208);
  v26[1] = v10;
  v14 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 304);
  v13 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 320);
  v26[2] = v12;
  v26[3] = v13;
  v15 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 336);
  v16 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 352);
  v26[4] = *(_OWORD *)(MEMORY[0x1E0DAB260] + 240);
  v26[5] = v15;
  v17 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 368);
  v18 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 384);
  v26[6] = v16;
  v26[7] = v17;
  v19 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 400);
  v26[8] = v18;
  v26[9] = v19;
  v20 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 432);
  v21 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 448);
  v26[10] = v11;
  v26[11] = v20;
  v26[12] = v14;
  v26[13] = v21;
  v26[14] = *(_OWORD *)(MEMORY[0x1E0DAB260] + 464);
  v27[0] = v1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke_2;
  v25[3] = &__block_descriptor_40_e23_q24__0r__CGSize_dd_8Q16l;
  v25[4] = *(_QWORD *)(a1 + 32);
  v22 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v25);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    _bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePad = ((uint64_t (**)(_QWORD, _OWORD *, uint64_t))v22)[2](v22, v26, 15);
  _bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePhone = ((uint64_t (**)(_QWORD, _OWORD *, uint64_t))v22)[2](v22, v27, 11);

}

uint64_t __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke_2(uint64_t a1, double *a2, uint64_t a3)
{
  void *v3;
  int v7;
  int v8;
  void *v9;
  double v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;
  char v20;
  int v21;
  char v22;
  int v23;
  _BOOL4 v25;

  v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom"))
    {
      v8 = 1;
      goto LABEL_9;
    }
  }
  v8 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v25 = 1;
    goto LABEL_17;
  }
LABEL_9:
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
    {
      v25 = SBFEffectiveHomeButtonType() == 2;

      goto LABEL_17;
    }

LABEL_16:
    v25 = 0;
LABEL_17:
    if ((v8 & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_16;
  v25 = SBFEffectiveHomeButtonType() == 2;
  if (v8)
LABEL_18:

LABEL_19:
  if (a3)
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
    v12 = a2 + 1;
    v13 = -1;
    while (1)
    {
      v15 = *(v12 - 1);
      v14 = *(_QWORD *)v12;
      v16 = objc_msgSend(*(id *)(a1 + 32), "_classicModeForLaunchingSize:", v15, *v12);
      if (v16 == -1)
        goto LABEL_38;
      v17 = v16;
      v18 = __sb__runningInSpringBoard();
      v19 = v18;
      if (v18)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v20 = BSSizeEqualToSize();
      if ((v19 & 1) == 0)

      if ((v20 & 1) != 0)
        return v17;
      v21 = __sb__runningInSpringBoard();
      v22 = v21;
      if (v21)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        a2 = (double *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v23 = BSSizeGreaterThanOrEqualToSize();
      if ((v22 & 1) == 0)

      if (!v23
        || (BSSizeGreaterThanOrEqualToSize() & 1) == 0
        && (!v25
         || !SBApplicationClassicModeExpectsRoundedCorners(v17)
         || SBApplicationClassicModeExpectsRoundedCorners(v13)))
      {
LABEL_38:
        v17 = v13;
        v14 = v11;
        v15 = v10;
      }
      v12 += 2;
      v10 = v15;
      v11 = v14;
      v13 = v17;
      if (!--a3)
        return v17;
    }
  }
  return -1;
}

- (void)_classicModeForHostingExtensionContainedInApplication:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend((id)objc_opt_class(), "KJHKJHw39rq9w87q903475q0983rskjd") & 1) != 0)
    {
      v4 = -1;
    }
    else
    {
      v5 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v8 = objc_msgSend(a1, "_classicAppScaledPhoneOnPad") ^ 1;
      else
        v8 = 0;
      v4 = objc_msgSend(v5, "_bestAvailableClassicModeForHostingExtensionContainedInApplication:", v8);
    }
    if ((-[SBApplication _bypassesClassicMode]((uint64_t)v3) & 1) != 0 || (unint64_t)(v4 + 1) <= 1)
    {
      a1 = (void *)objc_msgSend(a1, "_classicMode");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(a1, "_classicMode");
      objc_msgSend((id)objc_opt_class(), "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v10, v11);
      objc_msgSend((id)objc_opt_class(), "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v10, v4);
      if (BSSizeLessThanSize())
        a1 = (void *)v11;
      else
        a1 = (void *)v4;

    }
  }

  return a1;
}

- (id)_classicModeForHostingExtensionContainedInThisApplicationInUnknownHostingHierarchy
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend((id)objc_opt_class(), "KJHKJHw39rq9w87q903475q0983rskjd") & 1) != 0)
    {
      v2 = -1;
    }
    else
    {
      v3 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      v2 = objc_msgSend(v3, "_bestAvailableClassicModeForHostingExtensionContainedInApplication:", (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    }
    if ((objc_msgSend(v1[21], "disablesClassicMode") & 1) != 0
      || (objc_msgSend(v1[21], "hasViewServicesEntitlement") & 1) != 0)
    {
      return 0;
    }
    else
    {
      v6 = objc_msgSend(v1, "isSystemApplication");
      if ((unint64_t)(v2 - 1) >= 0xFFFFFFFFFFFFFFFELL)
        v7 = 0;
      else
        v7 = v2;
      if ((v6 & 1) != 0)
        return 0;
      else
        return (id *)v7;
    }
  }
  return result;
}

+ (int64_t)_bestClassicModeForScreenType:(unint64_t)a3
{
  if (a3 > 0x2D)
    return -1;
  else
    return qword_1D0E87F18[a3];
}

+ (uint64_t)_unobscuredScreenTypeForScreenType:(uint64_t)a1
{
  void *v3;
  NSObject *v5;
  int IsPad;
  int HasHomeButton;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_opt_self();
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
      return a2;
    case 25:
      v10 = objc_msgSend(v3, "KJHKJHw39rq9w87q903475q0983rskjd") == 0;
      v11 = 21;
      v12 = 25;
      goto LABEL_16;
    case 26:
      v10 = objc_msgSend(v3, "KJHKJHw39rq9w87q903475q0983rskjd") == 0;
      v11 = 22;
      v12 = 26;
      goto LABEL_16;
    case 27:
      v10 = objc_msgSend(v3, "KJHKJHw39rq9w87q903475q0983rskjd") == 0;
      v11 = 23;
      v12 = 27;
      goto LABEL_16;
    case 28:
      v10 = objc_msgSend(v3, "KJHKJHw39rq9w87q903475q0983rskjd") == 0;
      v11 = 24;
      v12 = 28;
LABEL_16:
      if (v10)
        a2 = v11;
      else
        a2 = v12;
      break;
    default:
      SBLogClassicMode();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[SBApplication _unobscuredScreenTypeForScreenType:].cold.1(a2, v5);

      IsPad = SBHScreenTypeIsPad();
      HasHomeButton = SBHScreenTypeHasHomeButton();
      v8 = 3;
      if (!HasHomeButton)
        v8 = 1;
      v9 = 29;
      if (HasHomeButton)
        v9 = 40;
      if (IsPad)
        a2 = v9;
      else
        a2 = v8;
      break;
  }
  return a2;
}

- (uint64_t)_screenTypeForClassicMode:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = a1;
  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 0xFFFFFFFFFFFFFFFDLL)
      return SBHScreenTypeForCurrentDevice();
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRoundCornerPad");
    v6 = objc_msgSend(v4, "isRoundCornerPhone");
    objc_msgSend((id)v2, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAzulLinked");

    if (v8 || !(v5 | v6))
    {
      v13 = SBHScreenTypeForCurrentDevice();
      v14 = objc_msgSend((id)objc_opt_class(), "_canonicalScreenTypeForClassicMode:", a2);
      v2 = objc_msgSend((id)objc_opt_class(), "_niceScreenTypeForClassicType:matchingAValidDisplayZoomModeOnScreenType:", v14, v13);
    }
    else
    {
      v9 = SBApplicationClassicModeExpectsRoundedCorners(a2);
      v10 = SBApplicationClassicModeRepresentsPad(a2);
      v11 = SBApplicationClassicModeRepresentsPhone(a2);
      if (v5)
      {
        if (v10 && v9)
        {
          v2 = 40;
        }
        else if ((v11 & v9) != 0)
        {
          v2 = 3;
        }
        else
        {
          v2 = 29;
        }
      }
      else
      {
        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__screenTypeForClassicMode_, v2, CFSTR("SBApplication+Classic.m"), 825, CFSTR("Not valid to have non-phone classic modes on a phone"));

        }
        if (v9)
          v2 = 3;
        else
          v2 = 1;
      }
    }

  }
  return v2;
}

- (void)_setDefaultClassicModeOverride:(int64_t)a3
{
  self->_defaultClassicModeOverride = a3;
}

- (uint64_t)_isNewEnoughToKnowAboutRoundPads
{
  if (result)
    return objc_msgSend(*(id *)(result + 168), "isPeaceBLinked");
  return result;
}

- (unint64_t)_supportedTypeForClassicModeNone
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  void *v6;
  int v7;
  char v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  char v14;
  int v15;
  char v16;
  char v17;
  char v18;
  int v19;
  char v20;
  int v21;
  char v22;
  char v23;
  void *v24;
  int v25;
  char v26;
  int v27;
  char v28;
  int v29;
  char v30;
  char v31;
  char v32;
  int v33;
  char v34;
  int v35;
  char v36;
  char v37;
  char v38;
  int v39;
  char v40;
  int v41;
  char v42;
  double v43;
  char v45;
  char v46;
  int v47;
  char v48;
  int v49;
  char v50;
  char v51;
  char v52;
  int v53;
  char v54;
  int v55;
  char v56;
  char v57;
  char v58;
  int v59;
  char v60;
  int v61;
  char v62;
  char v63;
  char v64;
  int v65;
  char v66;
  int v67;
  char v68;
  char v69;
  char v70;
  int v71;
  char v72;
  int v73;
  char v74;
  char v75;
  char v76;
  int v77;
  char v78;
  int v79;
  char v80;
  char v81;
  int v82;
  int v83;
  char v84;
  void *v85;
  unsigned int v86;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      v4 = __sb__runningInSpringBoard();
      v5 = v4;
      if (v4)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v9 = BSSizeEqualToSize();
      if ((v5 & 1) == 0)

      if ((v9 & 1) != 0)
        return 0x2000;
      v13 = __sb__runningInSpringBoard();
      v14 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v17 = BSSizeEqualToSize();
      if ((v14 & 1) == 0)

      if ((v17 & 1) != 0)
        return 4096;
      v19 = __sb__runningInSpringBoard();
      v20 = v19;
      if (v19)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v23 = BSSizeEqualToSize();
      if ((v20 & 1) == 0)

      if ((v23 & 1) != 0)
        return 2048;
      v27 = __sb__runningInSpringBoard();
      v28 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v31 = BSSizeEqualToSize();
      if ((v28 & 1) == 0)

      if ((v31 & 1) != 0)
        return 1024;
      v33 = __sb__runningInSpringBoard();
      v34 = v33;
      if (v33)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v37 = BSSizeEqualToSize();
      if ((v34 & 1) == 0)

      if ((v37 & 1) != 0)
        return 512;
      v39 = __sb__runningInSpringBoard();
      v40 = v39;
      if (v39)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v45 = BSSizeEqualToSize();
      if ((v40 & 1) == 0)

      if ((v45 & 1) != 0)
        return 256;
      v47 = __sb__runningInSpringBoard();
      v48 = v47;
      if (v47)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v51 = BSSizeEqualToSize();
      if ((v48 & 1) == 0)

      if ((v51 & 1) != 0)
        return 128;
      v53 = __sb__runningInSpringBoard();
      v54 = v53;
      if (v53)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v57 = BSSizeEqualToSize();
      if ((v54 & 1) == 0)

      if ((v57 & 1) != 0)
        return 64;
      v59 = __sb__runningInSpringBoard();
      v60 = v59;
      if (v59)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v63 = BSSizeEqualToSize();
      if ((v60 & 1) == 0)

      if ((v63 & 1) != 0)
        return 32;
      v65 = __sb__runningInSpringBoard();
      v66 = v65;
      if (v65)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v69 = BSSizeEqualToSize();
      if ((v66 & 1) == 0)

      if ((v69 & 1) != 0)
        return 16;
      v71 = __sb__runningInSpringBoard();
      v72 = v71;
      if (v71)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v75 = BSSizeEqualToSize();
      if ((v72 & 1) == 0)

      if ((v75 & 1) != 0)
        return 8;
      v77 = __sb__runningInSpringBoard();
      v78 = v77;
      if (v77)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v81 = BSSizeEqualToSize();
      if ((v78 & 1) == 0)

      if ((v81 & 1) != 0)
        return 4;
      v83 = __sb__runningInSpringBoard();
      v84 = v83;
      if (v83)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v86 = BSSizeEqualToSize();
      if ((v84 & 1) == 0)

      return v86;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v6, "userInterfaceIdiom");

    if (v2 != (void *)1)
      goto LABEL_3;
  }
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v11 = MEMORY[0x1E0DAB260];
  v12 = BSSizeEqualToSize();
  if ((v8 & 1) == 0)

  if ((v12 & 1) != 0)
    return 0x40000000;
  v15 = __sb__runningInSpringBoard();
  v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v18 = BSSizeEqualToSize();
  if ((v16 & 1) == 0)

  if ((v18 & 1) != 0)
    return 0xFFFFFFFF80000000;
  v21 = __sb__runningInSpringBoard();
  v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v24 = (void *)BSSizeEqualToSize();
  if ((v22 & 1) == 0)

  v25 = __sb__runningInSpringBoard();
  v26 = v25;
  if ((_DWORD)v24)
  {
    if (v25)
    {
      if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
        return 0x8000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "userInterfaceIdiom") != 1 || SBFEffectiveHomeButtonType() != 2)
      {
        v10 = 0x8000000;
LABEL_93:

        return v10;
      }
    }
    v29 = __sb__runningInSpringBoard();
    v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v43 < *(double *)(v11 + 424))
      v10 = 0x8000000;
    else
      v10 = 0x10000000;
    if ((v30 & 1) == 0)

    if ((v26 & 1) == 0)
      goto LABEL_93;
  }
  else
  {
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v32 = BSSizeEqualToSize();
    if ((v26 & 1) == 0)

    if ((v32 & 1) != 0)
    {
      return 0x20000000;
    }
    else
    {
      v35 = __sb__runningInSpringBoard();
      v36 = v35;
      if (v35)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v38 = BSSizeEqualToSize();
      if ((v36 & 1) == 0)

      if ((v38 & 1) != 0)
      {
        return 0x2000000;
      }
      else
      {
        v41 = __sb__runningInSpringBoard();
        v42 = v41;
        if (v41)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v46 = BSSizeEqualToSize();
        if ((v42 & 1) == 0)

        if ((v46 & 1) != 0)
        {
          return 0x4000000;
        }
        else
        {
          v49 = __sb__runningInSpringBoard();
          v50 = v49;
          if (v49)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "_referenceBounds");
          }
          BSSizeRoundForScale();
          v52 = BSSizeEqualToSize();
          if ((v50 & 1) == 0)

          if ((v52 & 1) != 0)
          {
            return 0x800000;
          }
          else
          {
            v55 = __sb__runningInSpringBoard();
            v56 = v55;
            if (v55)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "_referenceBounds");
            }
            BSSizeRoundForScale();
            v58 = BSSizeEqualToSize();
            if ((v56 & 1) == 0)

            if ((v58 & 1) != 0)
            {
              return 0x400000;
            }
            else
            {
              v61 = __sb__runningInSpringBoard();
              v62 = v61;
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "_referenceBounds");
              }
              BSSizeRoundForScale();
              v64 = BSSizeEqualToSize();
              if ((v62 & 1) == 0)

              if ((v64 & 1) != 0)
              {
                return 0x100000;
              }
              else
              {
                v67 = __sb__runningInSpringBoard();
                v68 = v67;
                if (v67)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "_referenceBounds");
                }
                BSSizeRoundForScale();
                v70 = BSSizeEqualToSize();
                if ((v68 & 1) == 0)

                if ((v70 & 1) != 0)
                {
                  return 0x80000;
                }
                else
                {
                  v73 = __sb__runningInSpringBoard();
                  v74 = v73;
                  if (v73)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                    v2 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "_referenceBounds");
                  }
                  BSSizeRoundForScale();
                  v76 = BSSizeEqualToSize();
                  if ((v74 & 1) == 0)

                  if ((v76 & 1) != 0)
                  {
                    return 0x40000;
                  }
                  else
                  {
                    v79 = __sb__runningInSpringBoard();
                    v80 = v79;
                    if (v79)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                      v2 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v2, "_referenceBounds");
                    }
                    BSSizeRoundForScale();
                    v82 = BSSizeEqualToSize();
                    if ((v80 & 1) == 0)

                    if (v82)
                    {
                      if (__sb__runningInSpringBoard())
                      {
                        if (SBFEffectiveDeviceClass() == 2)
                        {
                          if (SBFEffectiveHomeButtonType() == 2)
                            return 0x20000;
                          else
                            return 2;
                        }
                        else
                        {
                          return 2;
                        }
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v85, "userInterfaceIdiom") == 1)
                        {
                          if (SBFEffectiveHomeButtonType() == 2)
                            v10 = 0x20000;
                          else
                            v10 = 2;
                        }
                        else
                        {
                          v10 = 2;
                        }

                      }
                    }
                    else
                    {
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

- (BOOL)_isClassicViaOverride
{
  return (unint64_t)(self->_defaultClassicModeOverride - 1) < 0xFFFFFFFFFFFFFFFELL;
}

- (uint64_t)_isNewEnoughToKnowAbout2020Phones
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(*(id *)(result + 168), "isAzulHWLinked") & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = objc_msgSend(*(id *)(v1 + 168), "isAzulLinked");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(v1 + 168), "isAppleApplication");
    }
  }
  return result;
}

+ (int64_t)_classicModeReplacingMoreSpaceWithEquivalentStandardCanvasForClassicMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x16)
    return 20;
  else
    return qword_1D0E88088[a3 + 1];
}

+ (CGSize)_standardCanvasSizeForClassicMode:(int64_t)a3
{
  int64_t v3;
  double v5;
  double v6;
  CGSize result;

  v3 = a3;
  if (SBApplicationClassicModeRepresentsMoreSpace(a3))
    v3 = objc_msgSend(a1, "_classicModeReplacingMoreSpaceWithEquivalentStandardCanvasForClassicMode:", v3);
  objc_msgSend(a1, "_defaultLaunchingSizeForClassicMode:", v3);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (int64_t)_classicModeForLaunchingSize:(CGSize)a3
{
  void *v3;
  int v4;
  char v5;
  char v6;
  void *v8;
  uint64_t v9;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v6 = BSSizeEqualToSize();
  if ((v5 & 1) == 0)

  if ((v6 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_27;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 12;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 13;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 16;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 17;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 18;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 19;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 14;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 21;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 22;
LABEL_27:
  if ((BSSizeEqualToSize() & 1) != 0)
    return 1;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 2;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 3;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 4;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 6;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 7;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 8;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 9;
  if ((BSSizeEqualToSize() & 1) != 0)
    return 10;
  if (BSSizeEqualToSize())
    return 11;
  return -1;
}

void __67__SBApplication_Classic_Internal__KJHKJHw39rq9w87q903475q0983rskjd__block_invoke()
{
  char v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((os_variant_has_internal_content() & 1) != 0 || (objc_msgSend(v1, "isCarrierInstall") & 1) != 0)
    v0 = 0;
  else
    v0 = objc_msgSend(v1, "isDeveloperInstall") ^ 1;
  KJHKJHw39rq9w87q903475q0983rskjd_sRelaxable = v0;

}

- (void)_calculateSupportedTypesForSplashBoard
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int isNewEnoughToKnowAbout2020;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;

  v3 = -[SBApplicationInfo isMonarchLinked](self->_appInfo, "isMonarchLinked");
  v30 = -[SBApplicationInfo isTigrisLinked](self->_appInfo, "isTigrisLinked");
  v29 = -[SBApplicationInfo isPeaceLinked](self->_appInfo, "isPeaceLinked");
  v4 = -[SBApplicationInfo isYukonLinked](self->_appInfo, "isYukonLinked");
  v5 = -[SBApplicationInfo isAzulLinked](self->_appInfo, "isAzulLinked");
  isNewEnoughToKnowAbout2020 = -[SBApplication _isNewEnoughToKnowAbout2020Phones]((uint64_t)self);
  v7 = -[SBApplicationInfo isPeaceBLinked](self->_appInfo, "isPeaceBLinked");
  v8 = -[SBApplicationInfo isSkyLinked](self->_appInfo, "isSkyLinked");
  v9 = -[SBApplicationInfo isSydneyLinked](self->_appInfo, "isSydneyLinked");
  if ((objc_msgSend((id)objc_opt_class(), "KJHKJHw39rq9w87q903475q0983rskjd") & 1) != 0)
    v28 = 0;
  else
    v28 = -[SBApplicationInfo isBeta](self->_appInfo, "isBeta");
  v10 = -[SBApplicationInfo isCrystalLinked](self->_appInfo, "isCrystalLinked");
  if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 2))
  {
    v11 = -[SBApplicationInfo wantsFullScreen](self->_appInfo, "wantsFullScreen");
    if (v11)
      v12 = v30;
    else
      v12 = v3;
    if (v11)
      v13 = v7;
    else
      v13 = v3;
    if (v11)
      v14 = v5;
    else
      v14 = v3;
    if (v11)
      v15 = v4;
    else
      v15 = v3;
    if (v11)
      v16 = v8;
    else
      v16 = v3;
    if (v11)
      v17 = v9;
    else
      v17 = v3;
    v18 = 2;
    if (v3)
      v18 = 134217730;
    if (v12)
      v19 = self->_supportedTypes | v18 | 0x400000;
    else
      v19 = self->_supportedTypes | v18;
    if (v13)
      v19 |= 0x10820000uLL;
    if (v14)
      v19 |= 0x100000uLL;
    if (v15)
      v19 |= 0x80000uLL;
    if (v16)
      v19 |= 0x10000uLL;
    self->_supportedTypes = v19;
    if (v17)
    {
      self->_supportedTypes = v19 | 0x21200000;
      if (!v15)
        goto LABEL_42;
      v20 = -417071104;
    }
    else
    {
      if (!v15)
        goto LABEL_42;
      v20 = 1107558400;
    }
    self->_supportedTypes = v19 | v20;
  }
LABEL_42:
  if (-[SBApplication _supportsApplicationType:](self, "_supportsApplicationType:", 1))
  {
    v21 = 29;
    if (v30)
      v21 = 93;
    v22 = self->_supportedTypes | v21;
    if (v29)
      v22 |= 0x400uLL;
    v23 = 32;
    if (isNewEnoughToKnowAbout2020)
      v23 = 2208;
    v24 = v22 | v23;
    if (isNewEnoughToKnowAbout2020 | v5)
      v25 = v24;
    else
      v25 = v22;
    self->_supportedTypes = v25;
    v26 = !v10 | v28;
    if ((v9 | v26 ^ 1) == 1)
    {
      if (v9)
        v25 |= 0x1100uLL;
      if (v26)
        v27 = v25;
      else
        v27 = v25 | 0x2200;
      self->_supportedTypes = v27;
    }
  }
}

+ (BOOL)_displayZoomSizesOnThisDeviceNeedRedaction
{
  uint64_t v0;
  uint64_t v1;

  v0 = objc_opt_self();
  v1 = SBHScreenTypeForCurrentDevice();
  return SBHScreenTypeIsZoomed() && v1 != +[SBApplication _unobscuredScreenTypeForScreenType:](v0, v1);
}

- (void)flushSnapshotsForAllScenes
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v5;

  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1D0540000, "XBMigration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &v5);

  -[SBApplication _snapshotManifest](self, "_snapshotManifest", v5.opaque[0], v5.opaque[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSnapshotsUsingPredicateBuilder:", &__block_literal_global_15);

  os_activity_scope_leave(&v5);
}

uint64_t __54__SBApplication_Snapshots__flushSnapshotsForAllScenes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentTypeMask:", 1);
}

- (void)flushSnapshotsForAllScenesIncludingAllLegacyImages
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  os_activity_scope_state_s state;
  _BYTE v59[128];
  int buf;
  void *v61;
  __int16 v62;
  _QWORD v63[4];

  *(_QWORD *)((char *)&v63[1] + 2) = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1D0540000, "XBMigration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v2, &state);

  XBLogFileManifest();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543362;
    v61 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start flushSnapshotsForAllScenesIncludingAllLegacyImages", (uint8_t *)&buf, 0xCu);

  }
  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "containerPath");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  XBCachesPathForApplicationInfo();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("LaunchImages"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  XBLogFileManifest();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication info](self, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543618;
    v61 = v11;
    v62 = 2114;
    v63[0] = v48;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing legacy snapshot folder at %{public}@", (uint8_t *)&buf, 0x16u);

  }
  objc_msgSend(v6, "removeItemAtPath:error:", v48, 0);
  v12 = -[SBApplication isSystemApplication](self, "isSystemApplication");
  v13 = -[SBApplication isInternalApplication](self, "isInternalApplication");
  XBLogFileManifest();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication info](self, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543874;
    v61 = v16;
    v62 = 1024;
    LODWORD(v63[0]) = v12;
    WORD2(v63[0]) = 1024;
    *(_DWORD *)((char *)v63 + 6) = v13;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] we think we might have SplashBoard-generated images we want to keep. isSystemApplication: %d; isInter"
      "nalApplication: %d",
      (uint8_t *)&buf,
      0x18u);

  }
  if (v12 || v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentTypeMask:", 2);
    v46 = v17;
    objc_msgSend(v49, "defaultGroupIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "snapshotsForGroupID:matchingPredicate:", v18, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v47, "count"))
    {
      objc_msgSend(v6, "subpathsOfDirectoryAtPath:error:", v52, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bs_mapNoNulls:", &__block_literal_global_20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v55 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v52, "stringByAppendingPathExtension:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v25, &v53) & 1) != 0)
            {
              if (v53)
              {
                XBLogFileManifest();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  -[SBApplication info](self, "info");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "bundleIdentifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  buf = 138543618;
                  v61 = v28;
                  v62 = 2114;
                  v63[0] = v25;
                  _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing path because it's a directory: %{public}@", (uint8_t *)&buf, 0x16u);

                }
              }
              else
              {
                objc_msgSend(v24, "lastPathComponent");
                v26 = objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v50, "containsObject:", v26))
                {
                  XBLogFileManifest();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    -[SBApplication info](self, "info");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "bundleIdentifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    buf = 138543618;
                    v61 = v33;
                    v62 = 2114;
                    v63[0] = v26;
                    _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing snapshot because it's in our filenamesForExclusion: %{public}@", (uint8_t *)&buf, 0x16u);

                  }
                }
                else
                {
                  XBLogFileManifest();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    -[SBApplication info](self, "info");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "bundleIdentifier");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    buf = 138543618;
                    v61 = v36;
                    v62 = 2114;
                    v63[0] = v25;
                    _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing SplashBoard-generated images at: %{public}@", (uint8_t *)&buf, 0x16u);

                  }
                  objc_msgSend(v6, "removeItemAtPath:error:", v25, 0);
                }
              }
            }
            else
            {
              XBLogFileManifest();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                -[SBApplication info](self, "info");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "bundleIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                buf = 138543618;
                v61 = v30;
                v62 = 2114;
                v63[0] = v25;
                _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing path because it doesn't exist: %{public}@", (uint8_t *)&buf, 0x16u);

              }
            }

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v21);
      }

      goto LABEL_36;
    }
    XBLogFileManifest();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[SBApplication info](self, "info");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bundleIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      v61 = v39;
      v62 = 2114;
      v63[0] = v46;
      _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] nothing to keep after searching for snapshots we care about and finding nothing. predicate: %{public}@", (uint8_t *)&buf, 0x16u);

    }
  }
  XBLogFileManifest();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication info](self, "info");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bundleIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543618;
    v61 = v42;
    v62 = 2114;
    v63[0] = v52;
    _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing all files in folder: %{public}@", (uint8_t *)&buf, 0x16u);

  }
  objc_msgSend(v6, "removeItemAtPath:error:", v52, 0);
LABEL_36:
  XBLogFileManifest();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplication info](self, "info");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 138543362;
    v61 = v45;
    _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished flushSnapshotsForAllScenesIncludingAllLegacyImages", (uint8_t *)&buf, 0xCu);

  }
  os_activity_scope_leave(&state);
}

uint64_t __78__SBApplication_Snapshots__flushSnapshotsForAllScenesIncludingAllLegacyImages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filename");
}

- (void)flushSnapshotsForSceneID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1D0540000, "XBMigration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v7);

  -[SBApplication _snapshotManifest](self, "_snapshotManifest", v7.opaque[0], v7.opaque[1]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteSnapshotsForGroupID:predicateBuilder:", v4, &__block_literal_global_21);

  os_activity_scope_leave(&v7);
}

uint64_t __53__SBApplication_Snapshots__flushSnapshotsForSceneID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentTypeMask:", 1);
}

- (void)saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  v11 = _os_activity_create(&dword_1D0540000, "XBCapture", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &v12);

  -[SBApplication _xbactivity_saveSnapshotForSceneHandle:context:completion:](self, "_xbactivity_saveSnapshotForSceneHandle:context:completion:", v8, v9, v10, v12.opaque[0], v12.opaque[1]);
  os_activity_scope_leave(&v12);

}

- (void)saveSuspendSnapshot:(id)a3 forSceneHandle:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  SBSceneSnapshotDataProvider *v35;
  void *v36;
  void *v37;
  id v39;
  _QWORD v40[5];
  id v41;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication+Snapshots.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneSnapshot"));

  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1D0540000, "XBCapture", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  objc_msgSend(v39, "sceneIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interfaceOrientation");

  objc_msgSend(v9, "uiClientSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sb_effectiveInterfaceOrientation");

  if (v11 != v13)
  {
    XBLogCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SBApplication bundleIdentifier](self, "bundleIdentifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v27;
      v45 = 2114;
      v46 = v28;
      v47 = 2114;
      v48 = v29;
      _os_log_error_impl(&dword_1D0540000, v14, OS_LOG_TYPE_ERROR, "<%{public}@> Suspend snapshot cancelled due to orientation mismatch; settings are: %{public}@ but client setting"
        "s are %{public}@.",
        buf,
        0x20u);

    }
  }
  else
  {
LABEL_5:
    -[SBApplication _snapshotManifest](self, "_snapshotManifest");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sceneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject deleteSnapshotsForGroupID:predicateBuilder:](v14, "deleteSnapshotsForGroupID:predicateBuilder:", v16, &__block_literal_global_29);

    -[NSObject createSnapshotForSceneSnapshot:withName:](v14, "createSnapshotForSceneSnapshot:withName:", v6, CFSTR("SBSuspendSnapshot"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExpirationDate:", v18);

    objc_msgSend(v17, "beginImageAccessUntilExpiration");
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sceneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sceneWithIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "settings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v26;

    if (-[SBApplication isClassic](self, "isClassic") && objc_msgSend(v30, "isMainRootDisplay"))
    {
      -[SBApplication defaultLaunchingSizeForDisplayConfiguration:](self, "defaultLaunchingSizeForDisplayConfiguration:", v30);
      objc_msgSend(v17, "setReferenceSize:");
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "statusBarSettings");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v39;
      objc_msgSend(v32, "statusBarEffectiveStyleRequestWithStyle:", _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v31, "style")));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31 && (objc_msgSend(v31, "isHidden") & 1) == 0)
      {
        v37 = (void *)objc_msgSend(v31, "mutableCopy");
        objc_msgSend(v33, "legibilityStyle");
        v34 = _UIStatusBarStyleFromLegibilityStyle();
        if (v34 != objc_msgSend(v31, "style"))
        {
          objc_msgSend(v33, "legibilityStyle");
          objc_msgSend(v37, "setStyle:", _UIStatusBarStyleFromLegibilityStyle());
        }
        objc_msgSend(v17, "setStatusBarSettings:", v37);

      }
    }
    v35 = -[SBSceneSnapshotDataProvider initWithSceneSnapshot:scaleFactor:]([SBSceneSnapshotDataProvider alloc], "initWithSceneSnapshot:scaleFactor:", v6, 1.0);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_2;
    v40[3] = &unk_1E8E9DEB0;
    v40[4] = self;
    v41 = v6;
    -[NSObject generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:](v14, "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v17, v35, 0, v40, 0);

  }
  os_activity_scope_leave(&state);

}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setContentTypeMask:", 1);
  objc_msgSend(v2, "setName:", CFSTR("SBSuspendSnapshot"));

}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_3;
    v3[3] = &unk_1E8E9E820;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_noteSnapshotDidUpdateForSceneIdentifier:", v2);

}

- (void)createDownscaledVariantForSnapshot:(id)a3 sceneHandle:(id)a4 scaleFactor:(double)a5 didSaveImage:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v11, "variantID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("downscaled"));

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication+Snapshots.m"), 233, CFSTR("Can't create a downscaled variant for already downscaled snapshot."));

  }
  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke;
  v22[3] = &unk_1E8E9FBF0;
  v23 = v11;
  v24 = v12;
  v27 = a5;
  v25 = v16;
  v26 = v13;
  v17 = v13;
  v18 = v16;
  v19 = v12;
  v20 = v11;
  objc_msgSend(v18, "beginSnapshotAccessTransaction:completion:", v22, 0);

}

void __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  SBSnapshotDataProviderContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SBUIImageDataProvider *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "referenceSize");
  SBRectWithSize();
  objc_msgSend(v2, "setContentFrame:");
  objc_msgSend(*(id *)(a1 + 32), "variantWithIdentifier:", CFSTR("downscaled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = objc_alloc_init(SBSnapshotDataProviderContext);
    -[XBSnapshotDataProviderContext setOpaque:](v5, "setOpaque:", objc_msgSend(*(id *)(a1 + 32), "isImageOpaque"));
    objc_msgSend(*(id *)(a1 + 32), "imageScale");
    -[XBSnapshotDataProviderContext setScale:](v5, "setScale:");
    objc_msgSend(*(id *)(a1 + 40), "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSnapshotDataProviderContext setSceneID:](v5, "setSceneID:", v6);

    objc_msgSend(*(id *)(a1 + 32), "imageForInterfaceOrientation:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "createVariantForSnapshot:withIdentifier:", *(_QWORD *)(a1 + 32), CFSTR("downscaled"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      v10 = -[SBUIImageDataProvider initWithImage:context:scaleFactor:]([SBUIImageDataProvider alloc], "initWithImage:context:scaleFactor:", v7, v5, *(double *)(a1 + 64));
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke_2;
      v13[3] = &unk_1E8E9F1C0;
      v11 = *(void **)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v11, "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v9, v10, 1, 0, v13);

    }
    else
    {
      v12 = *(_QWORD *)(a1 + 56);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    }

  }
}

uint64_t __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllSnapshots
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_3;
  v4[3] = &unk_1E8E9DED8;
  objc_msgSend(v3, "beginSnapshotAccessTransaction:completion:", v5, v4);

}

void __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_snapshotManifest");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSnapshotsUsingPredicateBuilder:", &__block_literal_global_41);

}

uint64_t __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentTypeMask:", 1);
}

void __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_4;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteSnapshotDidUpdateForSceneIdentifier:", 0);
}

- (void)deleteSnapshotForContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1D0540000, "XBInvalidate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  objc_msgSend(v4, "sceneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  if (!v6 || v7 == 0.0)
  {
    XBLogFileManifest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBApplication(Snapshots) deleteSnapshotForContext:].cold.1();

  }
  else
  {
    -[SBApplication _snapshotManifest](self, "_snapshotManifest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke;
    v13[3] = &unk_1E8E9E820;
    v13[4] = self;
    v14 = v4;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_3;
    v11[3] = &unk_1E8E9E820;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v8, "beginSnapshotAccessTransaction:completion:", v13, v11);

  }
  os_activity_scope_leave(&state);

}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_snapshotManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sceneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_2;
  v4[3] = &unk_1E8E9FC38;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "deleteSnapshotsForGroupID:predicateBuilder:", v3, v4);

}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DA8F18];
  v4 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizeSnapshotName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v6);

  objc_msgSend(v9, "setContentTypeMask:", 1);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(v9, "setReferenceSize:", v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v9, "setImageScale:");

}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_4;
  v2[3] = &unk_1E8E9E820;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteSnapshotDidUpdateForSceneIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__SBApplication_Snapshots__manifest_didPurgeProtectedContentSnapshotsWithGroupIdentifiers___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __91__SBApplication_Snapshots__manifest_didPurgeProtectedContentSnapshotsWithGroupIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteSnapshotDidUpdateForSceneIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (void)_xbactivity_saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  double v82;
  double v83;
  SBSceneSnapshotDataProvider *v84;
  id v85;
  id v86;
  void *v87;
  SBSceneSnapshotDataProvider *v88;
  NSObject *queue;
  id v90;
  void *v91;
  id v92;
  SBSceneSnapshotDataProvider *v93;
  id v94;
  void *v95;
  SBSceneSnapshotDataProvider *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  CGFloat v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD block[4];
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  SBSceneSnapshotDataProvider *v118;
  SBSceneSnapshotDataProvider *v119;
  SBApplication *v120;
  id v121;
  id v122;
  id v123;
  void (**v124)(id, uint64_t);
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v8, "sceneIfExists");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v15 = v14;
    objc_msgSend(v9, "frame");
    if (!v12 || CGRectEqualToRect(*(CGRect *)&v16, *MEMORY[0x1E0C9D648]))
    {
      XBLogCapture();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.1();
LABEL_6:

      if (v10)
        v10[2](v10, 1);
      goto LABEL_8;
    }
    if (!v9)
    {
      XBLogCapture();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.2();
      goto LABEL_6;
    }
    objc_msgSend(v9, "sceneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      XBLogCapture();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.6((uint64_t)v12, v9, v20);
      goto LABEL_6;
    }
    objc_msgSend(v11, "uiPresentationManager");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (!v23)
    {
      XBLogCapture();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.3();

      if (v10)
        v10[2](v10, 4);
      goto LABEL_55;
    }
    if (v15 <= 0.0)
    {
      XBLogCapture();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.5();

      if (v10)
        v10[2](v10, 1);
      goto LABEL_55;
    }
    v109 = (void *)v23;
    objc_msgSend(MEMORY[0x1E0D22980], "contextWithFBSContext:", v9);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v107 = v28;

    v31 = v110;
    objc_msgSend(v110, "settings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v32;
    if (-[SBApplication isClassic](self, "isClassic"))
    {
      v33 = v32;
      v34 = objc_msgSend(v107, "isMainRootDisplay");
      objc_msgSend(v33, "frame");
      if ((v34 & 1) != 0)
      {
        -[SBApplication defaultLaunchingSizeForDisplayConfiguration:](self, "defaultLaunchingSizeForDisplayConfiguration:", v107);
        v38 = v37;
        v40 = v39;
        v31 = v110;
        objc_msgSend(v110, "frame");
        objc_msgSend(v107, "bounds");
        v42 = v41;
        v44 = v43;
        BSRectWithSize();
        v46 = v45;
        v48 = v47;
        v105 = v38;
        v49 = (v42 - v38) * 0.5;
        v50 = (v44 - v40) * 0.5;
        objc_msgSend(v110, "setFrame:", v49, v50);
        if (-[SBApplication classicAppRequiresHiDPI](self, "classicAppRequiresHiDPI"))
        {
          UIRectGetCenter();
          v131.origin.x = v49;
          v131.origin.y = (v44 - v40) * 0.5;
          v131.size.width = v46;
          v131.size.height = v48;
          v51 = round(CGRectGetWidth(v131) * 0.5);
          v132.origin.x = v49;
          v132.origin.y = v50;
          v132.size.width = v51;
          v132.size.height = v48;
          CGRectGetHeight(v132);
          UIRectCenteredAboutPoint();
          v53 = v52;
          v55 = v54;
          v103 = v56;
          v58 = v57;
        }
        else
        {
          v58 = v48;
          v103 = v46;
          v55 = (v44 - v40) * 0.5;
          v53 = v49;
        }
        v24 = v109;
        v133.origin.x = v49;
        v133.origin.y = v50;
        v133.size.width = v46;
        v133.size.height = v48;
        v63 = v53 - CGRectGetMinX(v133);
        v134.origin.x = v49;
        v134.origin.y = v50;
        v134.size.width = v46;
        v134.size.height = v48;
        v65 = v55 - CGRectGetMinY(v134);
        v69 = v58;
        v67 = v103;
        v60 = v105;
LABEL_40:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v70 = objc_msgSend(v8, "isTranslucent") ^ 1;
        else
          v70 = 1;
        objc_msgSend(v31, "setOpaque:", v70);
        objc_msgSend(v11, "clientSettings");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setClientSettings:", v71);

        objc_msgSend(v11, "createSnapshotWithContext:", v31);
        v72 = objc_claimAutoreleasedReturnValue();
        v102 = (void *)v72;
        if (!v72)
        {
          XBLogCapture();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.4(self, (uint64_t)v31, v77);

          v78 = v108;
          if (v10)
            v10[2](v10, 4);
          goto LABEL_54;
        }
        v73 = (void *)v72;
        objc_msgSend(v108, "interfaceOrientation");
        v74 = XBInterfaceOrientationMaskForInterfaceOrientationPair();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplication _snapshotManifest](self, "_snapshotManifest");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setContentTypeMask:", 1);
        objc_msgSend(v75, "setReferenceSize:", v60, v40);
        objc_msgSend(v75, "setInterfaceOrientationMask:", v74);
        objc_msgSend(MEMORY[0x1E0DA8F18], "normalizeSnapshotName:", v13);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setName:", v76);

        v104 = v75;
        objc_msgSend(v75, "setUserInterfaceStyle:", XBGetUIUserInterfaceStyleForSceneSnapshot(v73));
        XBGetCustomSafeAreaInsetsForSceneSnapshot(v73);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (__sb__runningInSpringBoard())
        {
          if (SBFEffectiveDeviceClass() != 2)
            goto LABEL_53;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "userInterfaceIdiom");

          if (v80 != 1)
          {
LABEL_53:
            objc_msgSend(v106, "snapshotsForGroupID:matchingPredicate:", v12, v104);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "createSnapshotForSceneSnapshot:withName:", v73, v13);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "setReferenceSize:", v60, v40);
            objc_msgSend(v101, "setContentFrame:", v63, v65, v67, v69);
            -[SBApplication _windowSceneFromApplicationSceneHandle:](self, "_windowSceneFromApplicationSceneHandle:", v8);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "switcherController");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "scaleForDownscaledSnapshotGenerationForSceneHandle:", v8);
            v83 = v82;

            v93 = -[SBSceneSnapshotDataProvider initWithSceneSnapshot:scaleFactor:]([SBSceneSnapshotDataProvider alloc], "initWithSceneSnapshot:scaleFactor:", v73, 1.0);
            v84 = -[SBSceneSnapshotDataProvider initWithSceneSnapshot:scaleFactor:]([SBSceneSnapshotDataProvider alloc], "initWithSceneSnapshot:scaleFactor:", v73, v83);
            -[SBSceneSnapshotDataProvider fallbackSnapshotDataProvider](v93, "fallbackSnapshotDataProvider");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBSceneSnapshotDataProvider fallbackSnapshotDataProvider](v84, "fallbackSnapshotDataProvider");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            dispatch_get_global_queue(21, 0);
            queue = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke;
            block[3] = &unk_1E8E9FCD8;
            v112 = v106;
            v113 = v101;
            v114 = v91;
            v115 = v73;
            v125 = v60;
            v126 = v40;
            v127 = v63;
            v128 = v65;
            v129 = v67;
            v130 = v69;
            v116 = v13;
            v117 = v87;
            v118 = v84;
            v119 = v93;
            v120 = self;
            v121 = v95;
            v122 = v12;
            v123 = v98;
            v124 = v10;
            v90 = v98;
            v99 = v95;
            v96 = v93;
            v88 = v84;
            v94 = v87;
            v92 = v91;
            v85 = v101;
            v86 = v106;
            dispatch_async(queue, block);

            v24 = v109;
            v31 = v110;
            v78 = v108;
LABEL_54:

LABEL_55:
LABEL_8:

            goto LABEL_11;
          }
        }
        objc_msgSend(v104, "setCustomSafeAreaInsets:", v100);
        goto LABEL_53;
      }
      v60 = v35;
      v40 = v36;
      v31 = v110;
    }
    else
    {
      objc_msgSend(v32, "frame");
      v60 = v59;
      v40 = v61;
    }
    objc_msgSend(v31, "frame");
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v24 = v109;
    goto LABEL_40;
  }
  if (v10)
    v10[2](v10, 3);
LABEL_11:

}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v2 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_2;
  v14[3] = &unk_1E8E9FCB0;
  v3 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 152);
  v27 = *(_OWORD *)(a1 + 136);
  v28 = v4;
  v29 = *(_OWORD *)(a1 + 168);
  v20 = *(id *)(a1 + 72);
  v21 = *(id *)(a1 + 80);
  v5 = *(id *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(void **)(a1 + 104);
  v22 = v5;
  v23 = v6;
  v24 = v7;
  v25 = *(id *)(a1 + 112);
  v26 = *(id *)(a1 + 128);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_46;
  v10[3] = &unk_1E8E9E270;
  v11 = *(id *)(a1 + 112);
  v8 = *(id *)(a1 + 120);
  v9 = *(_QWORD *)(a1 + 96);
  v12 = v8;
  v13 = v9;
  objc_msgSend(v3, "beginSnapshotAccessTransaction:completion:", v14, v10);

}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v2 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_3;
  v16[3] = &unk_1E8E9FC60;
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 144);
  v24 = *(_OWORD *)(a1 + 128);
  v25 = v3;
  v26 = *(_OWORD *)(a1 + 160);
  v22 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 80);
  v4 = (void *)MEMORY[0x1D17E5550](v16);
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_4;
  v10[3] = &unk_1E8E9FC88;
  v8 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v14 = v4;
  v10[4] = v7;
  v11 = *(id *)(a1 + 104);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 112);
  v15 = *(id *)(a1 + 120);
  v9 = v4;
  objc_msgSend(v5, "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v6, v8, 1, v10, 0);

}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "hasProtectedContent") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "createSnapshotForSceneSnapshot:withName:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v5 = v2;
      objc_msgSend(v2, "setReferenceSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
      objc_msgSend(v5, "setContentFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      objc_msgSend(*(id *)(a1 + 48), "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v5, *(_QWORD *)(a1 + 40), 1, 0, 0);
      if (*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 48), "createVariantForSnapshot:withIdentifier:", v5, CFSTR("downscaled"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          objc_msgSend(*(id *)(a1 + 48), "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v4, *(_QWORD *)(a1 + 72), 1, 0, 0);

      }
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(_QWORD *)(a1 + 80))
      return;
    objc_msgSend(*(id *)(a1 + 48), "createVariantForSnapshot:withIdentifier:", *(_QWORD *)(a1 + 32), CFSTR("downscaled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5 = v3;
      objc_msgSend(*(id *)(a1 + 48), "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v3, *(_QWORD *)(a1 + 80), 1, 0, 0);
LABEL_11:
      v3 = v5;
    }
  }

}

uint64_t __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    XBLogFileManifest();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] START liquidating the old, as snapshot generation succeeded", buf, 0xCu);

    }
    XBLogFileManifest();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting old snapshots: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "deleteSnapshots:", *(_QWORD *)(a1 + 40));
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_45;
    v15[3] = &unk_1E8E9FC38;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "deleteSnapshotsForGroupID:predicateBuilder:", v10, v15);
    XBLogFileManifest();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] STOP liquidating the old", buf, 0xCu);

    }
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
  {
    if (a2)
      v14 = 0;
    else
      v14 = 4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v14);
  }
  return result;
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setName:", CFSTR("SBSuspendSnapshot"));
  objc_msgSend(v3, "setContentTypeMask:", 1);
  XBLogFileManifest();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting old suspend snapshots using predicate: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  XBLogFileManifest();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_46_cold_1(a1, v2);

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_47;
  v3[3] = &unk_1E8E9E820;
  v3[4] = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteSnapshotDidUpdateForSceneIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_noteSnapshotDidUpdateForSceneIdentifier:(id)a3
{
  ++self->_appSnapshotSequenceID;
  -[SBApplication __noteSnapshotDidUpdate:forSceneIdentifier:](self, "__noteSnapshotDidUpdate:forSceneIdentifier:");
}

- (void)_noteSnapshotDidUpdateForSceneIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        ++self->_appSnapshotSequenceID;
        -[SBApplication __noteSnapshotDidUpdate:forSceneIdentifier:](self, "__noteSnapshotDidUpdate:forSceneIdentifier:");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)__noteSnapshotDidUpdate:(int64_t)a3 forSceneIdentifier:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  const __CFString **v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37D0];
  v8 = a4;
  objc_msgSend(v7, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v18[0] = CFSTR("SBApplicationSnapshotChangedSequenceUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("SBApplicationSnapshotChangedSceneIdentifierUserInfoKey");
    v19[0] = v10;
    v19[1] = v8;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (void **)v19;
    v13 = (const __CFString **)v18;
    v14 = 2;
  }
  else
  {
    v16 = CFSTR("SBApplicationSnapshotChangedSequenceUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v17;
    v13 = &v16;
    v14 = 1;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SBApplicationSnapshotChangedNotification"), self, v15);
}

- (CGSize)snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 contentFrame:(CGRect *)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  BSRectWithSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SBApplication info](self, "info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isStatusBarLegacy");

  if (!v19)
    goto LABEL_20;
  if ((unint64_t)(a4 - 1) <= 1)
  {
    v20 = *MEMORY[0x1E0DAA360];
    if (width != *MEMORY[0x1E0DAA360]
      || (v21 = *(double *)(MEMORY[0x1E0DAA360] + 8), height != v21 - *MEMORY[0x1E0CEBBE0]))
    {
      v20 = *MEMORY[0x1E0C9D820];
      v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (width == *MEMORY[0x1E0DAA358])
      {
        v20 = *MEMORY[0x1E0C9D820];
        v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (height == *(double *)(MEMORY[0x1E0DAA358] + 8) - *MEMORY[0x1E0CEBBE0])
        {
          v20 = *MEMORY[0x1E0DAA358];
          v21 = *(double *)(MEMORY[0x1E0DAA358] + 8);
        }
      }
    }
    if (v20 != *MEMORY[0x1E0C9D820] || v21 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      if (a4 == 1)
        v13 = v13 + *MEMORY[0x1E0CEBBE0];
      goto LABEL_21;
    }
LABEL_20:
    v21 = height;
    v20 = width;
    width = v15;
    height = v17;
    goto LABEL_21;
  }
  if ((unint64_t)(a4 - 3) > 1)
    goto LABEL_20;
  v21 = *(double *)(MEMORY[0x1E0DAA358] + 8);
  if (height != v21)
    goto LABEL_20;
  v20 = *MEMORY[0x1E0DAA358];
  v23 = *MEMORY[0x1E0CEBBE0];
  if (width != *MEMORY[0x1E0DAA358] - *MEMORY[0x1E0CEBBE0])
    goto LABEL_20;
  if (a4 != 4)
    v23 = -0.0;
  v11 = v11 + v23;
LABEL_21:
  if (a5)
  {
    a5->origin.x = v11;
    a5->origin.y = v13;
    a5->size.width = width;
    a5->size.height = height;
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_windowSceneFromApplicationSceneHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBApplication)initWithApplicationInfo:(id)a3
{
  id v6;
  SBApplication *v7;
  SBApplication *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  FBSApplicationDataStore *dataStore;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationInfo"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBApplication;
  v7 = -[SBApplication init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_appInfo, a3);
    objc_msgSend(v6, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v8->_bundleIdentifier);
    v11 = objc_claimAutoreleasedReturnValue();
    dataStore = v8->_dataStore;
    v8->_dataStore = (FBSApplicationDataStore *)v11;

    v8->_appSnapshotSequenceID = 0;
    v8->_defaultClassicModeOverride = -1;
    v8->_currentClassicMode = -1;
    -[SBApplication _updateRecentlyUpdatedTimer](v8, "_updateRecentlyUpdatedTimer");
    v8->_applicationRestorationCheckState = 0;
    v8->_supportedTypes = -[SBApplicationInfo supportedTypes](v8->_appInfo, "supportedTypes");
    -[SBApplication refreshLaunchImagesInSnapshotManifestIfNeeded](v8, "refreshLaunchImagesInSnapshotManifestIfNeeded");
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBApplicationWakeScheduler invalidate](self->_legacyVOIPPeriodicWakeScheduler, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBApplication;
  -[SBApplication dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBApplication descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSURL)bundleURL
{
  return -[FBSBundleInfo bundleURL](self->_appInfo, "bundleURL");
}

- (BOOL)isAppleApplication
{
  return -[SBApplicationInfo isAppleApplication](self->_appInfo, "isAppleApplication");
}

- (NSString)vendorName
{
  return -[SBApplicationInfo vendorName](self->_appInfo, "vendorName");
}

- (BOOL)isAnyTerminationAssertionHeld
{
  return self->_launchWillBePrevented;
}

- (void)setUninstalled:(BOOL)a3
{
  SBApplication *v3;
  XBApplicationSnapshotManifest *synchronized_snapshotManifest;
  SBApplication *v5;
  SBApplication *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_uninstalled)
  {
    objc_sync_exit(obj);
    v3 = obj;
  }
  else
  {
    obj->_uninstalled = 1;
    -[SBApplicationWakeScheduler invalidate](obj->_legacyVOIPPeriodicWakeScheduler, "invalidate");
    synchronized_snapshotManifest = obj->_synchronized_snapshotManifest;
    obj->_synchronized_snapshotManifest = 0;

    objc_sync_exit(obj);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v5 = (SBApplication *)objc_claimAutoreleasedReturnValue();
    -[SBApplication postNotificationName:object:](v5, "postNotificationName:object:", *MEMORY[0x1E0DAAA68], obj);
    v3 = v5;
  }

}

- (SBApplicationWakeScheduler)legacyVOIPPeriodicWakeScheduler
{
  SBApplicationWakeScheduler *v3;
  SBApplicationWakeScheduler *legacyVOIPPeriodicWakeScheduler;

  if (!self->_legacyVOIPPeriodicWakeScheduler
    && -[SBApplicationInfo supportsLegacyVOIPBackgroundMode](self->_appInfo, "supportsLegacyVOIPBackgroundMode"))
  {
    v3 = +[SBApplicationWakeSchedulerFactory newLegacyVOIPPeriodicWakeSchedulerForApplication:](SBApplicationWakeSchedulerFactory, "newLegacyVOIPPeriodicWakeSchedulerForApplication:", self);
    legacyVOIPPeriodicWakeScheduler = self->_legacyVOIPPeriodicWakeScheduler;
    self->_legacyVOIPPeriodicWakeScheduler = v3;

  }
  return self->_legacyVOIPPeriodicWakeScheduler;
}

- (SBApplicationAppProtectionAssistant)appProtectionAssistant
{
  SBApplicationAppProtectionAssistant *appProtectionAssistant;
  SBApplicationAppProtectionAssistant *v4;
  SBApplicationAppProtectionAssistant *v5;

  appProtectionAssistant = self->_appProtectionAssistant;
  if (!appProtectionAssistant)
  {
    +[SBApplicationAppProtectionAssistant assistantForApplication:](SBApplicationAppProtectionAssistant, "assistantForApplication:", self);
    v4 = (SBApplicationAppProtectionAssistant *)objc_claimAutoreleasedReturnValue();
    v5 = self->_appProtectionAssistant;
    self->_appProtectionAssistant = v4;

    appProtectionAssistant = self->_appProtectionAssistant;
  }
  return appProtectionAssistant;
}

- (BOOL)wantsAutoLaunchForVOIP
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBApplicationInfo supportsLegacyVOIPBackgroundMode](self->_appInfo, "supportsLegacyVOIPBackgroundMode");
  if (v3)
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationAutoLaunchForVoIP"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setWantsAutoLaunchForVOIP:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSString *bundleIdentifier;
  FBSApplicationDataStore *dataStore;
  void *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (-[SBApplicationInfo supportsLegacyVOIPBackgroundMode](self->_appInfo, "supportsLegacyVOIPBackgroundMode"))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->_bundleIdentifier;
      v9 = 138543618;
      v10 = bundleIdentifier;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Application %{public}@ wants auto-launch for VoIP: %{BOOL}u", (uint8_t *)&v9, 0x12u);
    }

    dataStore = self->_dataStore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:", v8, CFSTR("SBApplicationAutoLaunchForVoIP"));

  }
}

- (void)setPlayingAudio:(BOOL)a3
{
  if (self->_isPlayingAudio != a3)
  {
    self->_isPlayingAudio = a3;
    -[FBApplicationProcess setNowPlayingWithAudio:](self->_process, "setNowPlayingWithAudio:");
  }
}

- (void)setConnectedToExternalAccessory:(BOOL)a3
{
  if (self->_isConnectedToExternalAccessory != a3)
  {
    self->_isConnectedToExternalAccessory = a3;
    -[FBApplicationProcess setConnectedToExternalAccessory:](self->_process, "setConnectedToExternalAccessory:");
  }
}

- (BOOL)usesEdgeNetwork
{
  return -[SBApplication dataUsage](self, "dataUsage") & 1;
}

- (void)setUsesEdgeNetwork:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  v5 = -[SBApplication dataUsage](self, "dataUsage");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
    -[SBApplication _setDataUsage:](self, "_setDataUsage:", v5 & 0xFFFFFFFE | v3);
}

- (BOOL)usesWiFiNetwork
{
  return (-[SBApplication dataUsage](self, "dataUsage") >> 1) & 1;
}

- (void)setUsesWiFiNetwork:(BOOL)a3
{
  int v3;
  int v5;
  int v6;

  v3 = a3;
  v5 = -[SBApplication dataUsage](self, "dataUsage");
  if ((v5 & 2) != v3)
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    -[SBApplication _setDataUsage:](self, "_setDataUsage:", v5 & 0xFFFFFFFD | v6);
  }
}

- (BOOL)suppressesControlCenter
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isControlCenterAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isControlCenterAllowedInApps"))
      v5 = -[SBApplicationInfo disallowsControlCenter](self->_appInfo, "disallowsControlCenter");
    else
      v5 = 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)suppressesCoverSheetGesture
{
  return -[SBApplicationInfo disallowsNotificationCenter](self->_appInfo, "disallowsNotificationCenter");
}

- (BOOL)supportsMultitaskingShelf
{
  int v3;
  void *v4;
  void *v5;

  if (-[SBApplication isAppClip](self, "isAppClip"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[SBApplication info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "supportsMultiwindow"))
    {
      -[SBApplication bundleIdentifier](self, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.InCallService")) ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (SBDisplayItemLayoutAttributes)lastWindowLayoutAttributes
{
  SBDisplayItemLayoutAttributes *v3;
  void *v4;
  SBDisplayItemLayoutAttributes *v5;
  SBDisplayItemLayoutAttributes *v6;
  id cachedLastWindowLayoutAttributesOrNSNull;
  void *v8;
  SBDisplayItemLayoutAttributes *v9;
  SBDisplayItemLayoutAttributes *v10;

  v3 = (SBDisplayItemLayoutAttributes *)self->_cachedLastWindowLayoutAttributesOrNSNull;
  if (!v3)
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationLastWindowSizeKey"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = -[SBDisplayItemLayoutAttributes initWithPlistRepresentation:]([SBDisplayItemLayoutAttributes alloc], "initWithPlistRepresentation:", v4)) != 0)
    {
      v6 = v5;
      v3 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      v3 = 0;
    }
    cachedLastWindowLayoutAttributesOrNSNull = self->_cachedLastWindowLayoutAttributesOrNSNull;
    self->_cachedLastWindowLayoutAttributesOrNSNull = v6;

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
    v9 = 0;
  else
    v9 = v3;
  v10 = v9;

  return v10;
}

- (void)setLastWindowLayoutAttributes:(id)a3
{
  uint64_t v5;
  void *v6;
  void *cachedLastWindowLayoutAttributesOrNSNull;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v5 = objc_opt_class();
    objc_msgSend(v9, "plistRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v5, v6);
    cachedLastWindowLayoutAttributesOrNSNull = (void *)objc_claimAutoreleasedReturnValue();

    if (cachedLastWindowLayoutAttributesOrNSNull)
      -[FBSApplicationDataStore setObject:forKey:](self->_dataStore, "setObject:forKey:", cachedLastWindowLayoutAttributesOrNSNull, CFSTR("SBApplicationLastWindowSizeKey"));
    objc_storeStrong(&self->_cachedLastWindowLayoutAttributesOrNSNull, a3);
  }
  else
  {
    -[FBSApplicationDataStore removeObjectForKey:](self->_dataStore, "removeObjectForKey:", CFSTR("SBApplicationLastWindowSizeKey"));
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    cachedLastWindowLayoutAttributesOrNSNull = self->_cachedLastWindowLayoutAttributesOrNSNull;
    self->_cachedLastWindowLayoutAttributesOrNSNull = v8;
  }

}

- (void)setHasDisplayedLaunchAlert:(BOOL)a3 forType:(unint64_t)a4
{
  unint64_t displayedLaunchAlerts;
  unint64_t v5;
  unint64_t v6;

  displayedLaunchAlerts = self->_displayedLaunchAlerts;
  v5 = displayedLaunchAlerts & ~a4;
  v6 = displayedLaunchAlerts | a4;
  if (!a3)
    v6 = v5;
  self->_displayedLaunchAlerts = v6;
}

- (void)takeBackgroundActivityAttribution:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *backgroundActivityAttributions;
  NSMapTable *v7;
  NSMapTable *backgroundActivityAttributionsByIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplication takeBackgroundActivityAttribution:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBApplication.m"), 504, CFSTR("this call must be made on the main thread"));

  }
  v4 = v14;
  if (!self->_backgroundActivityAttributions)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 1);
    backgroundActivityAttributions = self->_backgroundActivityAttributions;
    self->_backgroundActivityAttributions = v5;

    v4 = v14;
  }
  if (!self->_backgroundActivityAttributionsByIdentifier)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    backgroundActivityAttributionsByIdentifier = self->_backgroundActivityAttributionsByIdentifier;
    self->_backgroundActivityAttributionsByIdentifier = v7;

    v4 = v14;
  }
  if (!-[NSHashTable containsObject:](self->_backgroundActivityAttributions, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_backgroundActivityAttributions, "addObject:", v14);
    objc_msgSend(v14, "backgroundActivityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DB0AF0];
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DB0AF0]))
    {
      -[NSMapTable objectForKey:](self->_backgroundActivityAttributionsByIdentifier, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "count"))
        objc_msgSend((id)SBApp, "addNowLocatingApp:", self);

    }
    if ((STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) == 0)
      objc_msgSend((id)SBApp, "addApp:forBackgroundActivityWithIdentifier:", self, v9);
    SBAddBackgroundActivityAttributionByIdentifier(v14, self->_backgroundActivityAttributionsByIdentifier);

  }
}

- (void)releaseBackgroundActivityAttribution:(id)a3
{
  NSHashTable *backgroundActivityAttributions;
  void *v5;
  uint64_t v6;
  void *v7;
  NSHashTable *v8;
  NSMapTable *backgroundActivityAttributionsByIdentifier;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplication releaseBackgroundActivityAttribution:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBApplication.m"), 533, CFSTR("this call must be made on the main thread"));

  }
  backgroundActivityAttributions = self->_backgroundActivityAttributions;
  if (backgroundActivityAttributions)
  {
    if (-[NSHashTable containsObject:](backgroundActivityAttributions, "containsObject:", v12))
    {
      -[NSHashTable removeObject:](self->_backgroundActivityAttributions, "removeObject:", v12);
      SBRemoveBackgroundActivityAttributionByIdentifier(v12, self->_backgroundActivityAttributionsByIdentifier);
      objc_msgSend(v12, "backgroundActivityIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0DB0AF0];
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0AF0]))
      {
        -[NSMapTable objectForKey:](self->_backgroundActivityAttributionsByIdentifier, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "count"))
          objc_msgSend((id)SBApp, "removeNowLocatingApp:", self);

      }
      if ((STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) == 0)
        objc_msgSend((id)SBApp, "removeApp:forBackgroundActivityWithIdentifier:", self, v5);

    }
    if (!-[NSHashTable count](self->_backgroundActivityAttributions, "count"))
    {
      v8 = self->_backgroundActivityAttributions;
      self->_backgroundActivityAttributions = 0;

    }
    if (!-[NSMapTable count](self->_backgroundActivityAttributionsByIdentifier, "count"))
    {
      backgroundActivityAttributionsByIdentifier = self->_backgroundActivityAttributionsByIdentifier;
      self->_backgroundActivityAttributionsByIdentifier = 0;

    }
  }

}

- (BOOL)shouldReceiveSourceApplicationContextFromOriginatingApplication:(id)a3
{
  id v4;
  SBApplicationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4)
  {
    v5 = self->_appInfo;
    if (-[SBApplicationInfo isYukonLinked](v5, "isYukonLinked"))
    {
      SBWorkspaceApplicationForIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "teamIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplicationInfo teamIdentifier](v5, "teamIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SBApplicationInfo isSystemApplication](v5, "isSystemApplication")
        || -[SBApplicationInfo alwaysReceivesOpenURLSource](v5, "alwaysReceivesOpenURLSource"))
      {
        v10 = 1;
      }
      else
      {
        v10 = objc_msgSend(v8, "isEqualToString:", v9);
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)markNewlyInstalled
{
  -[SBApplication _setNewlyInstalled:](self, "_setNewlyInstalled:", 1);
}

- (void)markRecentlyUpdated
{
  -[SBApplication _setRecentlyUpdated:](self, "_setRecentlyUpdated:", 1);
}

- (void)clearNewlyInstalledAndRecentlyUpdatedStatus
{
  -[SBApplication _setNewlyInstalled:](self, "_setNewlyInstalled:", 0);
  -[SBApplication _setRecentlyUpdated:](self, "_setRecentlyUpdated:", 0);
}

- (NSDate)nextWakeDate
{
  void *v2;
  void *v3;

  -[SBApplication legacyVOIPPeriodicWakeScheduler](self, "legacyVOIPPeriodicWakeScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduledDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setNextWakeDate:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBApplication info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsLegacyVOIPBackgroundMode");

  if (v5)
  {
    -[SBApplication legacyVOIPPeriodicWakeScheduler](self, "legacyVOIPPeriodicWakeScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleWakeForDate:", v7);

  }
}

- (BOOL)usesBackgroundNetwork
{
  return (-[SBApplication dataUsage](self, "dataUsage") >> 3) & 1;
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
  __int16 v4;
  int v5;

  if (a3)
  {
    v4 = 1;
  }
  else
  {
    if (!*((_WORD *)self + 43))
      goto LABEL_6;
    v4 = -1;
  }
  *((_WORD *)self + 43) += v4;
LABEL_6:
  v5 = -[SBApplication dataUsage](self, "dataUsage");
  if ((v5 & 8) != (*((_WORD *)self + 43) != 0))
    -[SBApplication _setDataUsage:](self, "_setDataUsage:", v5 & 0xFFFFFFF7 | (8 * (*((_WORD *)self + 43) != 0)));
}

- (id)_sceneIdentifierForStoredPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[SBApplication _dataStore](self, "_dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBApplication__sceneIdentifierForStoredPersistenceIdentifier___block_invoke;
  v9[3] = &unk_1E8EA1478;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateSceneStoresUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__SBApplication__sceneIdentifierForStoredPersistenceIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "objectForKey:", CFSTR("persistenceIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_clearSceneTitles
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBApplication__clearSceneTitles__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
}

void __34__SBApplication__clearSceneTitles__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_dataStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__SBApplication__clearSceneTitles__block_invoke_2;
  v11[3] = &unk_1E8EA14A0;
  v11[4] = &v12;
  objc_msgSend(v1, "enumerateSceneStoresUsingBlock:", v11);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)v13[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(v1, "sceneStoreForIdentifier:creatingIfNecessary:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), 1, (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectForKey:", CFSTR("canvasTitle"));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v3);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __34__SBApplication__clearSceneTitles__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (void)_setLaunchPrevented:(BOOL)a3
{
  self->_launchWillBePrevented = a3;
  -[SBApplication _noteIconDataSourceDidChange](self, "_noteIconDataSourceDidChange");
}

- (int)_applicationRestorationCheckState
{
  return self->_applicationRestorationCheckState;
}

- (void)_setApplicationRestorationCheckState:(int)a3
{
  self->_applicationRestorationCheckState = a3;
}

- (void)setInfo:(id)a3
{
  SBApplication *v5;
  SBApplicationInfo *v6;

  v6 = (SBApplicationInfo *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_appInfo == v6)
  {
    objc_sync_exit(v5);

  }
  else
  {
    objc_storeStrong((id *)&v5->_appInfo, a3);
    objc_sync_exit(v5);

    -[SBApplication _noteIconDataSourceDidChange](v5, "_noteIconDataSourceDidChange");
  }

}

- (id)_initializationRequestContext
{
  return -[SBApplication _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:](self, "_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:", 0);
}

- (void)_didExitWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  dispatch_time_t v12;
  SBApplication *v13;
  SBApplicationSupportServiceRequestContext *initializationContext;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[SBApplication _didExitWithContext:]";
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_lastExitContext, a3);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("SB_DISABLE_FAILED_LAUNCH_COUNTER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "exitReason") & 1) == 0 && !v10)
  {
    v11 = self->_failedLaunchCount + 1;
    self->_failedLaunchCount = v11;
    v12 = dispatch_time(0, 20000000000);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__SBApplication__didExitWithContext___block_invoke;
    v18[3] = &unk_1E8E9DE88;
    v18[4] = self;
    v18[5] = v11;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v18);
  }
  self->_applicationRestorationCheckState = 0;
  self->_showsProgressCount = 0;
  self->_currentClassicMode = -1;
  v13 = self;
  objc_sync_enter(v13);
  initializationContext = v13->_initializationContext;
  v13->_initializationContext = 0;

  objc_sync_exit(v13);
  objc_msgSend((id)SBApp, "menuButtonInterceptApp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBApplication isSameExecutableAsApplication:](v13, "isSameExecutableAsApplication:", v15);

  if (v16)
    objc_msgSend((id)SBApp, "setMenuButtonInterceptApp:forever:", 0, 0);
  objc_msgSend((id)SBApp, "setAppRegisteredForVolumeEvents:isActive:", v13, 0);
  objc_msgSend((id)SBApp, "setAppRegisteredForLockButtonEvents:isActive:", v13, 0);
  *((_WORD *)v13 + 43) = 0;
  -[SBApplication setUsesBackgroundNetwork:](v13, "setUsesBackgroundNetwork:", 0);
  -[SBApplication purgeCaches](v13, "purgeCaches");
  -[SBApplication _invalidateBackgroundActivityAttributions](v13, "_invalidateBackgroundActivityAttributions");
  -[SBApplication _updateProcess:withState:](v13, "_updateProcess:withState:", 0, 0);
  -[SBApplication setPlayingAudio:](v13, "setPlayingAudio:", 0);
  -[SBApplication setNowRecordingApplication:](v13, "setNowRecordingApplication:", 0);
  -[SBApplication setConnectedToExternalAccessory:](v13, "setConnectedToExternalAccessory:", 0);
  if (v13->_launchWillBePrevented)
    -[SBApplication _noteIconDataSourceDidChange](v13, "_noteIconDataSourceDidChange");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", CFSTR("SBApplicationDidExitNotification"), v13);

}

uint64_t __37__SBApplication__didExitWithContext___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 152))
    *(_QWORD *)(v1 + 152) = 0;
  return result;
}

+ (id)_appStateKeysToPrefetch
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SBApplicationAutoLaunchForVoIP");
  v3[1] = CFSTR("SBApplicationIsNewlyInstalled");
  v3[2] = CFSTR("SBApplicationRecentlyUpdated");
  v3[3] = CFSTR("SBApplicationRecentlyUpdatedTimerStartDate");
  v3[4] = CFSTR("SBApplicationBadgeKey");
  v3[5] = CFSTR("_SBScenes");
  v3[6] = *MEMORY[0x1E0DA8F70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setDataUsage:(int)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->_dataFlagsIsSet)
  {
    self->_dataFlagsIsSet = 1;
    *((_BYTE *)self + 84) = a3;
    goto LABEL_5;
  }
  v4 = *((unsigned __int8 *)self + 84);
  self->_dataFlagsIsSet = 1;
  *((_BYTE *)self + 84) = a3;
  if (v4 != a3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DAC2D8];
    v6 = (void *)MEMORY[0x1E0C99D80];
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0DAC428]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", v5, self, v8);

  }
}

- (void)purgeCaches
{
  SBApplication *obj;

  obj = self;
  objc_sync_enter(obj);
  -[XBApplicationSnapshotManifest purgeSnapshotsWithProtectedContent](obj->_synchronized_snapshotManifest, "purgeSnapshotsWithProtectedContent");
  objc_sync_exit(obj);

}

- (void)_updateRecentlyUpdatedTimer
{
  _BOOL4 v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  FBSApplicationDataStore *dataStore;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = -[SBApplication _isRecentlyUpdated](self, "_isRecentlyUpdated");
  -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBApplicationRecentlyUpdatedTimerStartDate"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      if (v5 <= -172800.0)
        -[SBApplication _setRecentlyUpdated:](self, "_setRecentlyUpdated:", 0);
    }
    else
    {
      +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && (objc_msgSend(v7, "isUILocked") & 1) == 0)
      {
        dataStore = self->_dataStore;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:", v10, CFSTR("SBApplicationRecentlyUpdatedTimerStartDate"));

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0DAC318];
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC318], 0);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__lockStateDidChange_, v12, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC318], 0);

    -[FBSApplicationDataStore removeObjectForKey:](self->_dataStore, "removeObjectForKey:", CFSTR("SBApplicationRecentlyUpdatedTimerStartDate"));
  }

}

- (void)_lockStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[SBApplication _isRecentlyUpdated](self, "_isRecentlyUpdated"))
  {
    -[SBApplication _updateRecentlyUpdatedTimer](self, "_updateRecentlyUpdatedTimer");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  }
}

- (void)_invalidateBackgroundActivityAttributions
{
  NSHashTable *backgroundActivityAttributions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplication _invalidateBackgroundActivityAttributions]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBApplication.m"), 1110, CFSTR("this call must be made on the main thread"));

  }
  backgroundActivityAttributions = self->_backgroundActivityAttributions;
  if (backgroundActivityAttributions)
  {
    -[NSHashTable allObjects](backgroundActivityAttributions, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__SBApplication__invalidateBackgroundActivityAttributions__block_invoke;
    v19[3] = &unk_1E8EA1508;
    v19[4] = self;
    objc_msgSend(v4, "bs_filter:", v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBBackgroundActivityAttributionManager sharedInstance](SBBackgroundActivityAttributionManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateBackgroundActivityAttributions:", v7);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[SBApplication releaseBackgroundActivityAttribution:](self, "releaseBackgroundActivityAttribution:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), (_QWORD)v15);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
}

uint64_t __58__SBApplication__invalidateBackgroundActivityAttributions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  objc_msgSend(a2, "activityAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasAuditToken") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "bundlePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      v6 = v13 ^ 1u;
    }
  }

  return v6;
}

- (void)launchFromIcon:(id)a3 location:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SBActivationSettings *v16;
  SBActivationSettings *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "activationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(SBActivationSettings);
  v17 = v16;
  SBLogIcon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    -[SBApplication bundleIdentifier](self, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v19;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Launching application %@ from icon %@, location: %@", (uint8_t *)&v21, 0x20u);

  }
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateApplication:fromIcon:location:activationSettings:actions:", self, v8, v9, v17, v15);

}

- (void)uninstall
{
  id v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uninstallApplication:", self);

}

- (id)icon:(id)a3 displayNameForObscuredDisabledLaunchForLocation:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBApplication displayName](self, "displayName", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBApplication isCacheCleaningTerminationAssertionHeld](self, "isCacheCleaningTerminationAssertionHeld"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLEANING_ICON_LABEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  void *v4;
  void *v5;

  -[FBSBundleInfo bundleIdentifier](self->_appInfo, "bundleIdentifier", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  void *v4;
  void *v5;

  -[FBSBundleInfo bundleIdentifier](self->_appInfo, "bundleIdentifier", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  SBIconImageInfo *v7;
  void *v8;
  void *v9;

  v7 = a4;
  SBHIconServicesOptionsForImageOptions();
  -[FBSBundleInfo bundleIdentifier](self->_appInfo, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithTraitCollection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[FBSBundleInfo bundleIdentifier](self->_appInfo, "bundleIdentifier", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBHHasCachedIconImagesForApplications();

  return v8;
}

- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[FBSBundleInfo bundleIdentifier](self->_appInfo, "bundleIdentifier", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBHCacheIconImagesForApplications();

}

- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  SBApplicationInfo *appInfo;
  SBIconImageInfo *v7;
  void *v8;
  void *v9;

  appInfo = self->_appInfo;
  v7 = a4;
  -[FBSBundleInfo bundleIdentifier](appInfo, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconServicesOptionsForImageOptions();
  SBHGetApplicationIconLayerWithTraitCollection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DAA488], "gridSizeClassSetForDefaultGridSizeClass", a3);
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  void *v4;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uninstallApplication:", self);

  return 1;
}

- (id)folderTitleOptionsForIcon:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplication info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "folderNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)folderFallbackTitleForIcon:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBApplication info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fallbackFolderName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "folderNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int64_t)dataOwnershipRoleAsDragDropTargetForIcon:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "dragDropTargetManagementStateForBundleID:", v5);

  if (v6 > 3)
    return 0;
  else
    return qword_1D0E88518[v6];
}

- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplication info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iTunesCategoriesOrderedByRelevancy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplication descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBApplication *v11;

  v4 = a3;
  -[SBApplication succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBApplication_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __55__SBApplication_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "processState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, CFSTR("processState"), 1);

}

uint64_t __45__SBApplication__noteIconDataSourceDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (FBProcessExitContext)lastExitContext
{
  return self->_lastExitContext;
}

- (unint64_t)failedLaunchCount
{
  return self->_failedLaunchCount;
}

- (BOOL)isRestoringIcon
{
  return self->_isRestoringApplicationFromHiding;
}

- (void)setRestoringIcon:(BOOL)a3
{
  self->_isRestoringApplicationFromHiding = a3;
}

- (BOOL)hasShownDataPlanAlertSinceLock
{
  return self->_hasShownDataPlanAlertSinceLock;
}

- (void)setHasShownDataPlanAlertSinceLock:(BOOL)a3
{
  self->_hasShownDataPlanAlertSinceLock = a3;
}

- (unint64_t)failedAutoLaunchCountForVOIP
{
  return self->_failedAutoLaunchCountForVOIP;
}

- (void)setFailedAutoLaunchCountForVOIP:(unint64_t)a3
{
  self->_failedAutoLaunchCountForVOIP = a3;
}

- (BOOL)isPlayingAudio
{
  return self->_isPlayingAudio;
}

- (BOOL)isNowRecordingApplication
{
  return self->_isNowRecordingApplication;
}

- (BOOL)isConnectedToExternalAccessory
{
  return self->_isConnectedToExternalAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionAssistant, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_legacyVOIPPeriodicWakeScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundActivityAttributionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActivityAttributions, 0);
  objc_storeStrong(&self->_cachedLastWindowLayoutAttributesOrNSNull, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_threadUnsafe_processState, 0);
  objc_storeStrong((id *)&self->_synchronized_snapshotManifest, 0);
  objc_storeStrong((id *)&self->_lazy_defaults, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

uint64_t __66__SBApplication_SnapshotSorting__snapshotSortDescriptorForScheme___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompare(a2, a3, *(_QWORD *)(a1 + 32));
}

+ (id)snapshotSortDescriptorForLaunchInterfaceIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DA8F40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__SBApplication_SnapshotSorting__snapshotSortDescriptorForLaunchInterfaceIdentifier___block_invoke;
  v8[3] = &unk_1E8EAC928;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", 3, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __85__SBApplication_SnapshotSorting__snapshotSortDescriptorForLaunchInterfaceIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompare(a2, a3, *(_QWORD *)(a1 + 32));
}

uint64_t __70__SBApplication_SnapshotSorting__snapshotSortDescriptorForImageScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "doubleValue");
  v6 = BSFloatEqualToFloat();
  v7 = BSFloatEqualToFloat();
  if ((v6 & 1) != 0 || v7)
  {
    v10 = -1;
    if (!v6)
      v10 = 1;
    if (v6 != v7)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    if (BSFloatGreaterThanFloat() && BSFloatGreaterThanFloat())
    {
      v8 = v4;
      v9 = v5;
    }
    else
    {
      v8 = v5;
      v9 = v4;
    }
    v11 = objc_msgSend(v8, "compare:", v9);
  }

  return v11;
}

uint64_t __82__SBApplication_SnapshotSorting__snapshotSortDescriptorPreferringProtectedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "BOOLValue");
  v6 = objc_msgSend(v4, "BOOLValue");

  v7 = -1;
  if (!v5)
    v7 = 1;
  if (v5 != v6)
    return v7;
  else
    return 0;
}

uint64_t __77__SBApplication_SnapshotSorting__snapshotSortDescriptorForRequiredOSVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = *(void **)(a1 + 32);
    if (!v8)
      goto LABEL_14;
    v9 = objc_msgSend(v8, "compare:options:", v5, 64);
    v10 = objc_msgSend(*(id *)(a1 + 32), "compare:options:", v7, 64);
    if ((v9 == -1) != (v10 == -1))
    {
      if (v10 == -1)
        v11 = -1;
      else
        v11 = 1;
      goto LABEL_16;
    }
    if ((v10 & v9) == 0xFFFFFFFFFFFFFFFFLL)
    {
      v13 = v5;
      v14 = v7;
    }
    else
    {
LABEL_14:
      v13 = v7;
      v14 = v5;
    }
    v11 = objc_msgSend(v13, "compare:options:", v14, 64);
    goto LABEL_16;
  }
  v12 = -1;
  if (v5)
    v12 = 1;
  if ((v5 == 0) != (v6 == 0))
    v11 = v12;
  else
    v11 = 0;
LABEL_16:

  return v11;
}

uint64_t __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForUIUserInterfaceStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  v8 = *(_QWORD *)(a1 + 32);
  if (!v8)
    return 0;
  v9 = v6 == v8 || v7 == v8;
  if (!v9)
    return 0;
  v9 = v6 == v8;
  v10 = (v6 == v8) ^ (v7 == v8);
  v11 = -1;
  if (!v9)
    v11 = 1;
  if (v10)
    return v11;
  else
    return 0;
}

+ (id)snapshotSortDescriptorForCustomSafeAreaInsets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DA8F40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForCustomSafeAreaInsets___block_invoke;
  v8[3] = &unk_1E8EACA50;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", 13, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForCustomSafeAreaInsets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = v7;
  if (v10
    && ((v11 = objc_msgSend(v8, "isEqual:", v10), v12 = objc_msgSend(v9, "isEqual:", v10), (v11 & 1) != 0) || v12))
  {
    v14 = -1;
    if (!v11)
      v14 = 1;
    if (v11 != v12)
      v13 = v14;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __62__SBApplication_ChamoisCapabilities__alwaysMaximizedInChamois__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.purplebuddy");
  v2[1] = CFSTR("com.apple.PrintKit.Print-Center");
  v2[2] = CFSTR("com.apple.sidecar");
  v2[3] = CFSTR("com.apple.ContinuityCaptureShieldUI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs;
  alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs = v0;

}

void __77__SBApplication_ChamoisCapabilities__restrictedToTheEmbeddedDisplayInChamois__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.purplebuddy");
  v2[1] = CFSTR("com.apple.PrintKit.Print-Center");
  v2[2] = CFSTR("com.apple.sidecar");
  v2[3] = CFSTR("com.apple.ContinuityCaptureShieldUI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs;
  restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs = v0;

}

- (id)mostRecentSceneSnapshotsForSceneHandle:(id)a3 scale:(double)a4 launchingOrientation:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8F38], "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentTypeMask:", 1);
  objc_msgSend(v10, "setImageScale:", a4);
  objc_msgSend(v10, "setInterfaceOrientationMask:", XBInterfaceOrientationMaskForInterfaceOrientationPair());
  objc_msgSend(MEMORY[0x1E0DA8F20], "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v10);
  objc_msgSend((id)objc_opt_class(), "snapshotSortDescriptorForCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v13);

  objc_msgSend(v8, "snapshotsForGroupID:fetchRequest:", v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_filter:", &__block_literal_global_279);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __97__SBApplication_DefaultImage__mostRecentSceneSnapshotsForSceneHandle_scale_launchingOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isExpired") & 1) != 0)
  {
    v3 = 0;
  }
  else if ((objc_msgSend(v2, "hasCachedImage") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "fileExists");
  }

  return v3;
}

- (id)imageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  return (id)objc_msgSend(a3, "imageForInterfaceOrientation:", a4);
}

- (id)cachedImageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  return (id)objc_msgSend(a3, "cachedImageForInterfaceOrientation:", a4);
}

- (id)_defaultLaunchImageBaseName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v2 = (void *)MEMORY[0x1E0DA8F18];
  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchImageFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizeSnapshotName:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("Default");
  v7 = v5;

  return v7;
}

- (void)refreshLaunchImagesInSnapshotManifestIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesSplashBoard");

  if ((v4 & 1) == 0)
  {
    -[SBApplication _dataStore](self, "_dataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplication _snapshotManifest](self, "_snapshotManifest");
    v6 = objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0DAC740];
    objc_msgSend(v5, "safeObjectForKey:ofType:", *MEMORY[0x1E0DAC740], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("SBLastBundleSequenceNumberForLaunchImageIngestion"));
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("SBLastIngestorVersionForLaunchImageIngestion"));
    }
    v33 = *MEMORY[0x1E0DAC748];
    objc_msgSend(v7, "bs_safeStringForKey:");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    else
      v9 = 0;
    v36 = (void *)v8;
    -[SBApplication info](self, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cacheGUID");
    v11 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v9;
    if (v9)
      v12 = BSEqualObjects() ^ 1;
    else
      v12 = 1;
    v32 = *MEMORY[0x1E0DAC758];
    objc_msgSend(v7, "bs_safeStringForKey:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplication info](self, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "installInstanceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)v11;
    if (v13)
      v16 = objc_msgSend(v15, "isEqual:", v13) ^ 1;
    else
      v16 = 1;
    v17 = *MEMORY[0x1E0DAC750];
    objc_msgSend(v7, "bs_safeNumberForKey:", *MEMORY[0x1E0DAC750]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");
    if (((v12 | v16) & 1) == 0 && v18 && v19 == 5)
    {
      v20 = v5;
      v21 = (void *)v6;
      v23 = v36;
      v22 = v37;
    }
    else
    {
      SBLogWorkspace();
      v24 = objc_claimAutoreleasedReturnValue();
      v31 = v5;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[SBApplication bundleIdentifier](self, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v43 = v29;
        v44 = 2112;
        v45 = v36;
        v46 = 2112;
        v47 = v37;
        v48 = 2112;
        v49 = v13;
        v50 = 2112;
        v51 = v15;
        v52 = 2112;
        v53 = v18;
        v54 = 2048;
        v55 = 5;
        v56 = 2112;
        v57 = v31;
        _os_log_error_impl(&dword_1D0540000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] savedCachedGUIDString=%@ currentCacheGUID=%@ savedInstallInstanceID=%@ currentInstallInstanceID=%@ savedIngestorVersionNSNumber=%@ currentIngestorVersion=%li dataStore=%@", buf, 0x52u);

      }
      XBLogFileManifest();
      v25 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v6;
      v23 = v36;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[SBApplication bundleIdentifier](self, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v43 = v30;
        v44 = 2112;
        v45 = v36;
        v46 = 2112;
        v47 = v37;
        v48 = 2112;
        v49 = v13;
        v50 = 2112;
        v51 = v15;
        v52 = 2112;
        v53 = v18;
        v54 = 2048;
        v55 = 5;
        v56 = 2112;
        v57 = v31;
        _os_log_error_impl(&dword_1D0540000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] ID Mismatch. purging and reingesting. savedCachedGUIDString=%@ currentCacheGUID=%@ savedInstallInstanceID=%@ currentInstallInstanceID=%@ savedIngestorVersionNSNumber=%@ currentIngestorVersion=%li dataStore=%@", buf, 0x52u);

      }
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __94__SBApplication_DefaultImage_ManifestIngestion__refreshLaunchImagesInSnapshotManifestIfNeeded__block_invoke;
      v38[3] = &unk_1E8E9E820;
      v38[4] = self;
      v39 = v21;
      objc_msgSend(v39, "beginSnapshotAccessTransaction:completion:", v38, 0);
      v40[0] = v33;
      v22 = v37;
      objc_msgSend(v37, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v26;
      v41[1] = v15;
      v40[1] = v32;
      v40[2] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      v28 = objc_claimAutoreleasedReturnValue();

      v20 = v31;
      objc_msgSend(v31, "setObject:forKey:", v28, v34);

      v7 = (void *)v28;
    }

  }
}

void __94__SBApplication_DefaultImage_ManifestIngestion__refreshLaunchImagesInSnapshotManifestIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_purgeStaticDefaultImagesInSnapshotManifest");
  objc_msgSend(*(id *)(a1 + 32), "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchImageInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v4, "_ingestInfoPlistImagesInManifest:", v5);
  }
  else
  {
    objc_msgSend(v4, "_defaultLaunchImageBaseName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ingestDefaultPNGsInManifest:withLaunchImageBaseName:", v5, v6);

  }
}

- (void)_resetLaunchImageIngestionStatus
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;

  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesSplashBoard");

  if ((v4 & 1) == 0)
  {
    XBLogFileManifest();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBApplication(DefaultImage_ManifestIngestion) _resetLaunchImageIngestionStatus].cold.1(self);

    -[SBApplication _dataStore](self, "_dataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0DAC740]);

  }
}

- (void)_purgeAndResetStaticDefaultImagesInSnapshotManifest
{
  void *v3;
  char v4;

  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesSplashBoard");

  if ((v4 & 1) == 0)
  {
    -[SBApplication _purgeStaticDefaultImagesInSnapshotManifest](self, "_purgeStaticDefaultImagesInSnapshotManifest");
    -[SBApplication _resetLaunchImageIngestionStatus](self, "_resetLaunchImageIngestionStatus");
  }
}

- (void)_reingestStaticDefaultImagesInSnapshotManifest
{
  void *v3;
  char v4;
  NSObject *v5;

  -[SBApplication info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesSplashBoard");

  if ((v4 & 1) == 0)
  {
    XBLogFileManifest();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBApplication(DefaultImage_ManifestIngestion) _resetLaunchImageIngestionStatus].cold.1(self);

    -[SBApplication _resetLaunchImageIngestionStatus](self, "_resetLaunchImageIngestionStatus");
    -[SBApplication refreshLaunchImagesInSnapshotManifestIfNeeded](self, "refreshLaunchImagesInSnapshotManifestIfNeeded");
    -[SBApplication _recalculateApplicationSupportedTypes](self, "_recalculateApplicationSupportedTypes");
  }
}

+ (void)_markAllManifestsForReingestion
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_resetLaunchImageIngestionStatus");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)_reingestStaticDefaultImagesForAllApps
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_reingestStaticDefaultImagesInSnapshotManifest");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_purgeStaticDefaultImagesInSnapshotManifest
{
  void *v2;
  id v3;

  -[SBApplication _snapshotManifest](self, "_snapshotManifest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultGroupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteSnapshotsForGroupID:predicateBuilder:", v2, &__block_literal_global_56);

}

uint64_t __92__SBApplication_DefaultImage_ManifestIngestion___purgeStaticDefaultImagesInSnapshotManifest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentTypeMask:", 4);
}

- (void)_ingestDefaultPNGsInManifest:(id)a3 withLaunchImageBaseName:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  float v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  float v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  float v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  double v117;
  double v118;
  NSObject *v119;
  void *v120;
  __int128 v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  NSObject *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  NSObject *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  uint64_t v151;
  SBApplication *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  uint8_t v180[4];
  void *v181;
  __int16 v182;
  void *v183;
  _BYTE buf[32];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v160 = a4;
  if (!v160)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplication+DefaultImage.m"), 505, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchImageBaseName != nil"));

  }
  v152 = self;
  -[SBApplication info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D01700]);
  objc_msgSend(v8, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

  objc_msgSend(v7, "defaultGroupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "backgroundStyle");
  v14 = objc_msgSend(v8, "statusBarHidden");
  v15 = objc_msgSend(v8, "defaultStatusBarStyle");
  v16 = objc_alloc_init(MEMORY[0x1E0DA8F60]);
  objc_msgSend(v16, "setHidden:", v14);
  objc_msgSend(v16, "setStyle:", v15);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundlePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = 0;
  objc_msgSend(v17, "contentsOfDirectoryAtPath:error:", v18, &v179);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v179;
  if (!v20)
  {
    v21 = v13;
    v140 = v17;
    v141 = v18;
    v146 = v12;
    v142 = v8;
    v148 = v7;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(self BEGINSWITH %@) AND (pathExtension ==[c] 'png')"), v160);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    +[SBApplicationLaunchImageParameters validInfoPlistOrientationKeys](SBApplicationLaunchImageParameters, "validInfoPlistOrientationKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR("|"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("-(%@)"), v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v178 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("@(\\d)x"), 0, &v178);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v178;
    v177 = v27;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("~(ipad|iphone)"), 0, &v177);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v177;

    v176 = v28;
    v138 = (void *)v26;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v26, 0, &v176);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v176;

    v175 = v29;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("-(\\d{3,4})w"), 0, &v175);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v175;

    v174 = v30;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("-(\\d{3,4})h"), 0, &v174);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v174;

    v173 = v31;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("-([A-Za-z][A-Za-z\\-\\+0-9\\.]+)"), 0, &v173);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v173;

    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v32 = v22;
    v168 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v169, v185, 16);
    if (!v168)
      goto LABEL_85;
    v167 = *(_QWORD *)v170;
    v33 = *MEMORY[0x1E0C9D820];
    v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v35 = *MEMORY[0x1E0DAA360];
    v143 = *(double *)(MEMORY[0x1E0DAA360] + 8);
    v37 = *MEMORY[0x1E0DAA358];
    v36 = *(double *)(MEMORY[0x1E0DAA358] + 8);
    v154 = v11;
    v155 = v19;
    v144 = v21;
    v149 = v16;
    v165 = v32;
    while (1)
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v170 != v167)
          objc_enumerationMutation(v32);
        v39 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v38);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = (void *)MEMORY[0x1D17E5334]();
          objc_msgSend(v11, "pathForResource:ofType:", v39, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "pathExtension");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(MEMORY[0x1E0DA8F18], "isValidImageFileExtension:") & 1) != 0)
          {
            v164 = v40;
            objc_msgSend(v39, "stringByDeletingPathExtension");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", v160, &stru_1E8EC7EC0);
            v43 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v159, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v44;
            v46 = 1.0;
            if (v44 && (unint64_t)objc_msgSend(v44, "numberOfRanges") >= 2)
            {
              v47 = objc_msgSend(v45, "rangeAtIndex:", 1);
              -[NSObject substringWithRange:](v43, "substringWithRange:", v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "floatValue");
              v46 = v50;

              v51 = objc_msgSend(v45, "rangeAtIndex:", 0);
              -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v51, v52, &stru_1E8EC7EC0);
              v53 = objc_claimAutoreleasedReturnValue();

              v43 = v53;
            }
            objc_msgSend(v158, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v54;
            if (v54 && (unint64_t)objc_msgSend(v54, "numberOfRanges") >= 2)
            {
              v56 = objc_msgSend(v55, "rangeAtIndex:", 1);
              -[NSObject substringWithRange:](v43, "substringWithRange:", v56, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v36;
              v60 = v37;
              if ((objc_msgSend(v58, "isEqualToString:", CFSTR("ipad")) & 1) == 0)
              {
                v61 = objc_msgSend(v58, "isEqualToString:", CFSTR("iphone"));
                if (v61)
                  v59 = v143;
                else
                  v59 = v34;
                if (v61)
                  v60 = v35;
                else
                  v60 = v33;
              }
              v62 = objc_msgSend(v55, "rangeAtIndex:", 0);
              -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v62, v63, &stru_1E8EC7EC0);
              v64 = objc_claimAutoreleasedReturnValue();

              v43 = v64;
            }
            else
            {
              v59 = v34;
              v60 = v33;
            }
            objc_msgSend(v157, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v69;
            v163 = v45;
            if (v69 && (unint64_t)objc_msgSend(v69, "numberOfRanges") >= 2)
            {
              v71 = objc_msgSend(v70, "rangeAtIndex:", 1);
              -[NSObject substringWithRange:](v43, "substringWithRange:", v71, v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = v39;
              v74 = v41;
              v75 = v11;
              v76 = v16;
              v77 = XBInterfaceOrientationForString();
              v78 = objc_msgSend(v70, "rangeAtIndex:", 0);
              -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v78, v79, &stru_1E8EC7EC0);
              v80 = v70;
              v81 = objc_claimAutoreleasedReturnValue();

              v82 = v77;
              v16 = v76;
              v11 = v75;
              v41 = v74;
              v39 = v150;
              v43 = v81;
              v70 = v80;
            }
            else
            {
              v82 = 1;
            }
            objc_msgSend(v156, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = v83;
            v161 = v70;
            v162 = v55;
            if (!v83 || (unint64_t)objc_msgSend(v83, "numberOfRanges") < 2)
            {
              v66 = v43;
              goto LABEL_43;
            }
            v85 = v16;
            v86 = v82;
            v87 = objc_msgSend(v84, "rangeAtIndex:", 1);
            -[NSObject substringWithRange:](v43, "substringWithRange:", v87, v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "floatValue");
            v59 = v90;

            v91 = objc_msgSend(v84, "rangeAtIndex:", 0);
            -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v91, v92, &stru_1E8EC7EC0);
            v66 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v145, "firstMatchInString:options:range:", v66, 0, 0, -[NSObject length](v66, "length"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v93;
            if (v93 && (unint64_t)objc_msgSend(v93, "numberOfRanges") >= 2)
            {
              v95 = objc_msgSend(v94, "rangeAtIndex:", 1);
              -[NSObject substringWithRange:](v66, "substringWithRange:", v95, v96);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "floatValue");
              v60 = v98;

              v99 = objc_msgSend(v94, "rangeAtIndex:", 0);
              -[NSObject stringByReplacingCharactersInRange:withString:](v66, "stringByReplacingCharactersInRange:withString:", v99, v100, &stru_1E8EC7EC0);
              v101 = objc_claimAutoreleasedReturnValue();

              v66 = v101;
              goto LABEL_42;
            }
            if ((BSFloatEqualToFloat() & 1) != 0)
            {
              v60 = v35;
LABEL_42:

              v82 = v86;
              v16 = v85;
              v11 = v154;
LABEL_43:
              objc_msgSend(v153, "firstMatchInString:options:range:", v66, 0, 0, -[NSObject length](v66, "length"));
              v102 = objc_claimAutoreleasedReturnValue();
              v103 = v102;
              if (v102 && (unint64_t)-[NSObject numberOfRanges](v102, "numberOfRanges") >= 2)
              {
                v104 = v82;
                v105 = -[NSObject rangeAtIndex:](v103, "rangeAtIndex:", 1);
                -[NSObject substringWithRange:](v66, "substringWithRange:", v105, v106);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[SBApplication isSystemApplication](v152, "isSystemApplication")
                  || (objc_msgSend(v142, "urlSchemes"),
                      v107 = (void *)objc_claimAutoreleasedReturnValue(),
                      v108 = objc_msgSend(v107, "containsObject:", v94),
                      v107,
                      (v108 & 1) != 0))
                {
                  v109 = -[NSObject rangeAtIndex:](v103, "rangeAtIndex:", 0);
                  -[NSObject stringByReplacingCharactersInRange:withString:](v66, "stringByReplacingCharactersInRange:withString:", v109, v110, &stru_1E8EC7EC0);
                  v111 = objc_claimAutoreleasedReturnValue();

                  v66 = v111;
                  v11 = v154;
                  v82 = v104;
                  v16 = v149;
                  goto LABEL_49;
                }
                XBLogFileManifest();
                v116 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
LABEL_78:

                  v11 = v154;
                  v16 = v149;
                  goto LABEL_79;
                }
                -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                v119 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v119;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v94;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = v39;
                _os_log_error_impl(&dword_1D0540000, v116, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Invalid scheme ('%{public}@') not declared in plist for %{public}@, skipping...", buf, 0x20u);
LABEL_61:

                goto LABEL_78;
              }
              v94 = 0;
LABEL_49:
              if (-[NSObject length](v66, "length"))
              {
                XBLogFileManifest();
                v112 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v130;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v66;
                  *(_WORD *)&buf[22] = 2114;
                  *(_QWORD *)&buf[24] = v39;
                  _os_log_error_impl(&dword_1D0540000, v112, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Extranenous content ('%{public}@') left over after processing permitted modifiers in %{public}@, skipping...", buf, 0x20u);

                  v11 = v154;
                }

LABEL_79:
                v19 = v155;
                v40 = v164;
LABEL_80:

                objc_autoreleasePoolPop(v40);
                v32 = v165;
                goto LABEL_81;
              }
              if (v60 == v33)
              {
                v113 = v146;
                if (v59 == v34)
                {
                  v114 = v82;
                  XBLogFileManifest();
                  v115 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
                  {
                    -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v131;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v39;
                    _os_log_debug_impl(&dword_1D0540000, v115, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] Need to load the image to get size for %{public}@", buf, 0x16u);

                    v113 = v146;
                  }

                  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v41);
                  v116 = objc_claimAutoreleasedReturnValue();
                  -[NSObject size](v116, "size");
                  if (v117 == v33 && v118 == v34)
                  {
                    XBLogFileManifest();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    {
                      -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)&buf[4] = v133;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v39;
                      _os_log_error_impl(&dword_1D0540000, v119, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] zero image size for %{public}@", buf, 0x16u);

                    }
                    goto LABEL_61;
                  }
                  if ((unint64_t)(v114 - 3) >= 2)
                    v59 = v118;
                  else
                    v59 = v117;
                  if ((unint64_t)(v114 - 3) >= 2)
                    v60 = v117;
                  else
                    v60 = v118;

                  v82 = v114;
                }
              }
              else
              {
                v113 = v146;
              }
              v151 = v82;
              v121 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
              *(_OWORD *)buf = *MEMORY[0x1E0C9D648];
              *(_OWORD *)&buf[16] = v121;
              -[SBApplication snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:interfaceOrientation:contentFrame:](v152, "snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:interfaceOrientation:contentFrame:", v82, buf, v60, v59);
              v123 = v122;
              v125 = v124;
              objc_msgSend(v148, "createSnapshotWithGroupID:", v113);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              XBLogFileManifest();
              v127 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
              {
                -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v180 = 138543618;
                v181 = v147;
                v182 = 2114;
                v183 = v39;
                _os_log_debug_impl(&dword_1D0540000, v127, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] going to save %{public}@", v180, 0x16u);

              }
              -[SBApplication _normalizeSnapshotName:](v152, "_normalizeSnapshotName:", v160);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "setName:", v128);

              objc_msgSend(v126, "setScheme:", v94);
              objc_msgSend(v126, "setContentType:", 2);
              objc_msgSend(v126, "setFullScreen:", 1);
              objc_msgSend(v126, "setReferenceSize:", v123, v125);
              objc_msgSend(v126, "setContentFrame:", *(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
              objc_msgSend(v126, "setInterfaceOrientation:", v151);
              v16 = v149;
              objc_msgSend(v126, "setStatusBarSettings:", v149);
              objc_msgSend(v126, "setBackgroundStyle:", v144);
              v129 = objc_alloc_init(MEMORY[0x1E0DA8F68]);
              objc_msgSend(v129, "setScale:", v46);
              objc_msgSend(v129, "setOpaque:", v144 == 0);
              objc_msgSend(v148, "saveSnapshot:atPath:withContext:", v126, v41, v129);

            }
            else
            {
              XBLogFileManifest();
              v103 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v132;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v39;
                _os_log_error_impl(&dword_1D0540000, v103, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Invalid size modifiers for %{public}@, skipping...", buf, 0x16u);

              }
              v16 = v85;
            }
            v11 = v154;
            goto LABEL_79;
          }
          XBLogFileManifest();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
            v67 = v40;
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v68;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v39;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v41;
            _os_log_error_impl(&dword_1D0540000, v66, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Candidate: <%{public}@> references a path: <%{public}@> with an unsupported image file extension; skipping...",
              buf,
              0x20u);

            v40 = v67;
          }
          goto LABEL_80;
        }
        XBLogFileManifest();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          -[SBApplication bundleIdentifier](v152, "bundleIdentifier");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v120;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v39;
          _os_log_debug_impl(&dword_1D0540000, v65, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] Candidate isn't a string: %{public}@, skipping...", buf, 0x16u);

        }
LABEL_81:
        ++v38;
      }
      while (v168 != v38);
      v134 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v169, v185, 16);
      v168 = v134;
      if (!v134)
      {
LABEL_85:

        v7 = v148;
        v8 = v142;
        v17 = v140;
        v18 = v141;
        if (!objc_msgSend(v32, "count"))
        {
          XBLogFileManifest();
          v135 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
            -[SBApplication(DefaultImage_ManifestIngestion) _ingestDefaultPNGsInManifest:withLaunchImageBaseName:].cold.1(v152);

          v18 = v141;
        }

        v12 = v146;
        v20 = v137;
        break;
      }
    }
  }

}

- (void)_ingestInfoPlistImagesInManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  SBApplication *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  SBApplication *v49;
  id v50;
  void *v51;
  unsigned int v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  double v58;
  uint8_t buf[4];
  NSObject *v60;
  __int16 v61;
  NSObject *v62;
  __int16 v63;
  NSObject *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBApplication info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchImageInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v51 = v4;
    objc_msgSend(v4, "defaultGroupIdentifier");
    v48 = objc_claimAutoreleasedReturnValue();
    v7 = -[SBApplication classicAppScaled](self, "classicAppScaled");
    v46 = objc_msgSend(v5, "backgroundStyle");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    v58 = v10;
    v11 = objc_alloc_init(MEMORY[0x1E0DA8F60]);
    objc_msgSend(v11, "setHidden:", objc_msgSend(v5, "statusBarHidden"));
    v45 = v5;
    v47 = v11;
    objc_msgSend(v11, "setStyle:", objc_msgSend(v5, "defaultStatusBarStyle"));
    v12 = objc_alloc(MEMORY[0x1E0D01700]);
    v13 = self;
    -[SBApplication info](self, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v12, "initWithURL:", v15);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v44 = v6;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (!v17)
      goto LABEL_28;
    v18 = v17;
    v52 = !v7;
    v19 = *(_QWORD *)v55;
    v20 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v49 = v13;
    v50 = v16;
    while (1)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(v16);
        v23 = *(NSObject **)(*((_QWORD *)&v54 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1D17E5334]();
        -[NSObject size](v23, "size");
        if (v25 == v20 && v26 == v21)
        {
          XBLogFileManifest();
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          -[SBApplication bundleIdentifier](v13, "bundleIdentifier");
          v34 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v34;
          v61 = 2114;
          v62 = v23;
          _os_log_error_impl(&dword_1D0540000, v32, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] skipping parameters: %{public}@ because it specifies a zero size.", buf, 0x16u);
          goto LABEL_22;
        }
        v28 = v25;
        v29 = v26;
        -[NSObject defaultPNGName](v23, "defaultPNGName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject extension](v23, "extension");
        v31 = objc_claimAutoreleasedReturnValue();
        -[SBApplication _preferredImagePathInBundle:baseResourceName:ofType:forMainScene:size:scale:outScale:](v13, "_preferredImagePathInBundle:baseResourceName:ofType:forMainScene:size:scale:outScale:", v53, v30, v31, v52, &v58, v28, v29, v58);
        v32 = objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        LOBYTE(v31) = objc_opt_isKindOfClass();
        XBLogFileManifest();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if ((v31 & 1) == 0)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            -[SBApplication bundleIdentifier](v13, "bundleIdentifier");
            v41 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v41;
            v61 = 2114;
            v62 = v32;
            v63 = 2114;
            v64 = v23;
            _os_log_error_impl(&dword_1D0540000, v34, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] Incorrect image path type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x20u);

          }
LABEL_22:

          goto LABEL_26;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          -[SBApplication bundleIdentifier](v13, "bundleIdentifier");
          v40 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v40;
          v61 = 2114;
          v62 = v23;
          _os_log_debug_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] going to save %{public}@", buf, 0x16u);

        }
        -[NSObject pathExtension](v32, "pathExtension");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x1E0DA8F18], "isValidImageFileExtension:", v35) & 1) != 0)
        {
          objc_msgSend(v51, "createSnapshotWithGroupID:", v48);
          v36 = objc_claimAutoreleasedReturnValue();
          -[NSObject setContentType:](v36, "setContentType:", 2);
          -[NSObject setFullScreen:](v36, "setFullScreen:", 1);
          -[NSObject setReferenceSize:](v36, "setReferenceSize:", v28, v29);
          -[NSObject setInterfaceOrientation:](v36, "setInterfaceOrientation:", -[NSObject interfaceOrientation](v23, "interfaceOrientation"));
          -[NSObject minOSVersionString](v23, "minOSVersionString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setRequiredOSVersion:](v36, "setRequiredOSVersion:", v37);

          -[NSObject setStatusBarSettings:](v36, "setStatusBarSettings:", v47);
          -[NSObject setBackgroundStyle:](v36, "setBackgroundStyle:", v46);
          v38 = objc_alloc_init(MEMORY[0x1E0DA8F68]);
          objc_msgSend(v38, "setScale:", v58);
          objc_msgSend(v38, "setOpaque:", v46 == 0);
          XBLogFileManifest();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            -[SBApplication bundleIdentifier](v49, "bundleIdentifier");
            v42 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v42;
            v61 = 2114;
            v62 = v36;
            _os_log_debug_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] going to save snapshot: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v51, "saveSnapshot:atPath:withContext:", v36, v32, v38);

          v13 = v49;
        }
        else
        {
          XBLogFileManifest();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            -[SBApplication bundleIdentifier](v13, "bundleIdentifier");
            v43 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v43;
            v61 = 2114;
            v62 = v32;
            _os_log_error_impl(&dword_1D0540000, v36, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] references a path: <%{public}@> with an unsupported image file extension; skipping...",
              buf,
              0x16u);

          }
        }

        v16 = v50;
LABEL_26:

        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v18 != v22);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      if (!v18)
      {
LABEL_28:

        v4 = v51;
        v6 = v44;
        v5 = v45;
        goto LABEL_31;
      }
    }
  }
  XBLogFileManifest();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    -[SBApplication(DefaultImage_ManifestIngestion) _ingestInfoPlistImagesInManifest:].cold.1(self);
LABEL_31:

}

- (id)_preferredImagePathInBundle:(id)a3 baseResourceName:(id)a4 ofType:(id)a5 forMainScene:(BOOL)a6 size:(CGSize)a7 scale:(double)a8 outScale:(double *)a9
{
  void *v9;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  int v20;
  char v21;
  int v22;
  int v23;
  int v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  int v35;

  height = a7.height;
  width = a7.width;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = __sb__runningInSpringBoard();
  v21 = v20;
  if (v20)
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      goto LABEL_30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "userInterfaceIdiom"))
    {

      goto LABEL_30;
    }
  }
  v22 = __sb__runningInSpringBoard();
  if (v22)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v23 = 0;
      v35 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "userInterfaceIdiom") != 1)
    {
      v23 = 0;
      v35 = 1;
      goto LABEL_17;
    }
  }
  v35 = v22 ^ 1;
  v24 = __sb__runningInSpringBoard();
  if (v24)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v29 = 1;
    if ((v24 & 1) == 0)
      goto LABEL_21;
LABEL_24:
    if (!v35)
      goto LABEL_26;
    goto LABEL_25;
  }
  v23 = v24 ^ 1;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_referenceBounds");
  v29 = height != v28 || width != v27;

  if (!v23)
    goto LABEL_24;
LABEL_21:

  if ((v35 & 1) != 0)
LABEL_25:

LABEL_26:
  if ((v21 & 1) != 0)
  {
    if (!v29)
      goto LABEL_31;
  }
  else
  {

    if (!v29)
    {
LABEL_31:
      -[SBApplication _preferredImagePathByScaleInBundle:resourceName:ofType:scale:outScale:](self, "_preferredImagePathByScaleInBundle:resourceName:ofType:scale:outScale:", v17, v18, v19, a9, a8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
  }
LABEL_30:
  SBFModifiedImageNameForName();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication _preferredImagePathByScaleInBundle:resourceName:ofType:scale:outScale:](self, "_preferredImagePathByScaleInBundle:resourceName:ofType:scale:outScale:", v17, v30, v19, a9, a8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
    goto LABEL_31;
LABEL_32:

  return v31;
}

- (id)_preferredImagePathByScaleInBundle:(id)a3 resourceName:(id)a4 ofType:(id)a5 scale:(double)a6 outScale:(double *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t i;
  void *v21;
  double *v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices1;
  if (a6 == 3.0)
    v14 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices3;
  if (a6 == 2.0)
    v15 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices2;
  else
    v15 = v14;
  v16 = *v15;
  if (*v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    v23 = a7;
    v24 = v12;
    while (2)
    {
      ++v15;
      v18 = _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixes[v16];
      objc_msgSend(v12, "stringByAppendingString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 3; ++i)
      {
        objc_msgSend(v19, "stringByAppendingString:", _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____deviceModifiers[i], v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pathForResource:ofType:", v21, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (v23)
            *v23 = _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixScales[v16];

          v12 = v24;
          goto LABEL_17;
        }
      }

      v17 = 0;
      v16 = *v15;
      v12 = v24;
      if (*v15 != 0x7FFFFFFFFFFFFFFFLL)
        continue;
      break;
    }
  }
LABEL_17:

  return v17;
}

- (BOOL)isSpringBoard
{
  void *v2;
  void *v3;
  char v4;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FBSystemAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isMobilePhone
{
  void *v2;
  char v3;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilephone"));

  return v3;
}

- (BOOL)isFaceTime
{
  void *v2;
  char v3;

  -[SBApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.facetime"));

  return v3;
}

+ (void)_unobscuredScreenTypeForScreenType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBHStringForScreenType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unknown classic mode used: %@ (%ld)", (uint8_t *)&v5, 0x16u);

}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_46_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  double v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  v5 = 138543618;
  v6 = v3;
  v7 = 2048;
  v8 = -v4;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Finished writing snapshots after %.2f sec", (uint8_t *)&v5, 0x16u);
}

@end
