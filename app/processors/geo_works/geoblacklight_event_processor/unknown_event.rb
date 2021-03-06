module GeoWorks
  class GeoblacklightEventProcessor
    class UnknownEvent < Processor
      attr_reader :event
      def initialize(event)
        @event = event
      end

      def process
        Rails.logger.info("Unable to process event type #{event_type}")
        false
      end
    end
  end
end
