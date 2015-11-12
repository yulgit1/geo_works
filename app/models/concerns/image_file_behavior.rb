# Attributes and methods for image files
module ImageFileBehavior
  extend ActiveSupport::Concern

  included do
    type [Hydra::PCDM::Vocab::PCDMTerms.Object,
          Hydra::Works::Vocab::WorksTerms.GenericFile,
          "http://projecthydra.org/geoconcerns/models#ImageFile"]
  end

  # Defines type by what it is and isn't
  # @return [Boolean]
  def image?
    false
  end

  def image_file?
    true
  end

  def raster?
    false
  end

  def raster_file?
    false
  end

  def vector?
    false
  end

  def vector_file?
    false
  end

  def external_metadata_file?
    false
  end

  # Retrieve the JPEG preview for the raster data set
  # @return [Hydra::PCDM::File]
  # @see Hydra::Works::GenericFile#thumbnail
  def preview
    thumbnail
  end

  # Retrieve the Image Work of which this Object is a member
  # @return [GeoConcerns::Image]
  def image
    generic_works.find { |parent| parent.class.included_modules.include?(::ImageBehavior) }
  end
end