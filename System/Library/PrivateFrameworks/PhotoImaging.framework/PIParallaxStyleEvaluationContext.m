@implementation PIParallaxStyleEvaluationContext

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxStyleEvaluationContext parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; parameters = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CIImage)lightMapImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PIParallaxStyleEvaluationContext guideImage](self, "guideImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIParallaxStyleEvaluationContext localLightData](self, "localLightData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[PICoreImageUtilities loadFilterWithName:](PICoreImageUtilities, "loadFilterWithName:", CFSTR("_PIDynamicLocalLightMapPrepare"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxStyleEvaluationContext guideImage](self, "guideImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("inputGuideImage"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lightMap"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("inputLightMap"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lightMapWidth"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("inputLightMapWidth"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lightMapHeight"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("inputLightMapHeight"));

      objc_msgSend(v5, "outputImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return (CIImage *)v10;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)outputImage
{
  return self->_outputImage;
}

- (void)setOutputImage:(id)a3
{
  objc_storeStrong((id *)&self->_outputImage, a3);
}

- (CIImage)guideImage
{
  return self->_guideImage;
}

- (void)setGuideImage:(id)a3
{
  objc_storeStrong((id *)&self->_guideImage, a3);
}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)setMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_matteImage, a3);
}

- (CIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setLocalLightData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PIParallaxFilterCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_guideImage, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
