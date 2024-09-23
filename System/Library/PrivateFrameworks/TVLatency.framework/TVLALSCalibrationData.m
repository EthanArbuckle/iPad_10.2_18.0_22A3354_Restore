@implementation TVLALSCalibrationData

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[10];
  _QWORD v32[12];

  v32[10] = *MEMORY[0x24BDAC8D0];
  -[TVLALSCalibrationData version](self, "version");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return MEMORY[0x24BDBD1B8];
  v4 = (void *)v3;
  -[TVLALSCalibrationData displayID](self, "displayID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_18;
  v6 = (void *)v5;
  -[TVLALSCalibrationData spectrumNom](self, "spectrumNom");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_17:

LABEL_18:
    return MEMORY[0x24BDBD1B8];
  }
  v8 = (void *)v7;
  -[TVLALSCalibrationData wavelengthStartVisible](self, "wavelengthStartVisible");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)v9;
  -[TVLALSCalibrationData wavelengthStartNIR](self, "wavelengthStartNIR");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_15:

    goto LABEL_16;
  }
  v12 = (void *)v11;
  -[TVLALSCalibrationData wavelengthEnd](self, "wavelengthEnd");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_14:

    goto LABEL_15;
  }
  v14 = (void *)v13;
  -[TVLALSCalibrationData wavelengthStep](self, "wavelengthStep");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_14;
  }
  v16 = (void *)v15;
  -[TVLALSCalibrationData channels](self, "channels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    return MEMORY[0x24BDBD1B8];
  v32[0] = &unk_24E3EEA68;
  -[TVLALSCalibrationData version](self, "version", CFSTR("ALS_CALIBRATION_RESERVED"), CFSTR("ALS_CALIBRATION_VERSION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v18;
  v31[2] = CFSTR("ALS_CALIBRATION_DISPLAY_ID");
  -[TVLALSCalibrationData displayID](self, "displayID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  v31[3] = CFSTR("ALS_CALIBRATION_NCHANNELS");
  -[TVLALSCalibrationData channels](self, "channels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v20;
  v31[4] = CFSTR("ALS_CALIBRATION_SPECTRUM_NOM");
  -[TVLALSCalibrationData spectrumNom](self, "spectrumNom");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v21;
  v31[5] = CFSTR("ALS_CALIBRATION_NARMALIZATION_FACTOR");
  -[TVLALSCalibrationData normalizationFactor](self, "normalizationFactor");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = &unk_24E3EEA68;
  v32[5] = v24;
  v31[6] = CFSTR("ALS_CALIBRATION_WAVELENGTH_END");
  -[TVLALSCalibrationData wavelengthEnd](self, "wavelengthEnd");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v25;
  v31[7] = CFSTR("ALS_CALIBRATION_WAVELENGTH_STEP");
  -[TVLALSCalibrationData wavelengthStep](self, "wavelengthStep");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v26;
  v31[8] = CFSTR("ALS_CALIBRATION_WAVELENGTH_START_NIR");
  -[TVLALSCalibrationData wavelengthStartNIR](self, "wavelengthStartNIR");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v27;
  v31[9] = CFSTR("ALS_CALIBRATION_WAVELENGTH_START_VISIBLE");
  -[TVLALSCalibrationData wavelengthStartVisible](self, "wavelengthStartVisible");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)instanceFromDictionary:(id)a3
{
  id v3;
  TVLALSCalibrationData *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TVLALSCalibrationData *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  v3 = a3;
  v4 = objc_alloc_init(TVLALSCalibrationData);
  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_VERSION"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &unk_24E3EEA68;
  -[TVLALSCalibrationData setVersion:](v4, "setVersion:", v7);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_DISPLAY_ID"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &unk_24E3EEA68;
  -[TVLALSCalibrationData setDisplayID:](v4, "setDisplayID:", v10);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_NCHANNELS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setChannels:](v4, "setChannels:", v11);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_SPECTRUM_NOM"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setSpectrumNom:](v4, "setSpectrumNom:", v12);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_WAVELENGTH_START_VISIBLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStartVisible:](v4, "setWavelengthStartVisible:", v13);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_WAVELENGTH_START_NIR"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStartNIR:](v4, "setWavelengthStartNIR:", v14);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_WAVELENGTH_END"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthEnd:](v4, "setWavelengthEnd:", v15);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_WAVELENGTH_STEP"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStep:](v4, "setWavelengthStep:", v16);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_CALIBRATION_NARMALIZATION_FACTOR"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVLALSCalibrationData setNormalizationFactor:](v4, "setNormalizationFactor:", v17);
  -[TVLALSCalibrationData version](v4, "version");
  v18 = (TVLALSCalibrationData *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[TVLALSCalibrationData displayID](v4, "displayID");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[TVLALSCalibrationData spectrumNom](v4, "spectrumNom");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        -[TVLALSCalibrationData wavelengthStartVisible](v4, "wavelengthStartVisible");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          -[TVLALSCalibrationData wavelengthStartNIR](v4, "wavelengthStartNIR");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            -[TVLALSCalibrationData wavelengthEnd](v4, "wavelengthEnd");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (void *)v27;
              -[TVLALSCalibrationData wavelengthStep](v4, "wavelengthStep");
              v29 = objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = (void *)v29;
                -[TVLALSCalibrationData channels](v4, "channels");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31)
                {
                  v18 = v4;
                  goto LABEL_23;
                }
LABEL_22:
                v18 = 0;
                goto LABEL_23;
              }

            }
          }

        }
      }

    }
    goto LABEL_22;
  }
LABEL_23:

  return v18;
}

- (NSNumber)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (NSNumber)wavelengthStartVisible
{
  return self->_wavelengthStartVisible;
}

- (void)setWavelengthStartVisible:(id)a3
{
  objc_storeStrong((id *)&self->_wavelengthStartVisible, a3);
}

- (NSNumber)wavelengthStartNIR
{
  return self->_wavelengthStartNIR;
}

- (void)setWavelengthStartNIR:(id)a3
{
  objc_storeStrong((id *)&self->_wavelengthStartNIR, a3);
}

- (NSNumber)wavelengthEnd
{
  return self->_wavelengthEnd;
}

- (void)setWavelengthEnd:(id)a3
{
  objc_storeStrong((id *)&self->_wavelengthEnd, a3);
}

- (NSNumber)wavelengthStep
{
  return self->_wavelengthStep;
}

- (void)setWavelengthStep:(id)a3
{
  objc_storeStrong((id *)&self->_wavelengthStep, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (NSNumber)normalizationFactor
{
  return self->_normalizationFactor;
}

- (void)setNormalizationFactor:(id)a3
{
  objc_storeStrong((id *)&self->_normalizationFactor, a3);
}

- (NSArray)spectrumNom
{
  return self->_spectrumNom;
}

- (void)setSpectrumNom:(id)a3
{
  objc_storeStrong((id *)&self->_spectrumNom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spectrumNom, 0);
  objc_storeStrong((id *)&self->_normalizationFactor, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_wavelengthStep, 0);
  objc_storeStrong((id *)&self->_wavelengthEnd, 0);
  objc_storeStrong((id *)&self->_wavelengthStartNIR, 0);
  objc_storeStrong((id *)&self->_wavelengthStartVisible, 0);
  objc_storeStrong((id *)&self->_channels, 0);
}

@end
