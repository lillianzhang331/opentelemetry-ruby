# frozen_string_literal: true

# Copyright 2019 OpenTelemetry Authors
#
# SPDX-License-Identifier: Apache-2.0
require 'logger'

require 'opentelemetry/error'
require 'opentelemetry/context'
require 'opentelemetry/distributed_context'
require 'opentelemetry/internal'
require 'opentelemetry/metrics'
require 'opentelemetry/trace'
require 'opentelemetry/version'

# OpenTelemetry provides global accessors for telemetry objects
module OpenTelemetry
  extend self

  attr_writer :tracer_factory, :meter, :distributed_context_manager

  attr_accessor :logger

  # @return [Object, Trace::TracerFactory] registered tracer factory or a
  #   default no-op implementation of the tracer factory.
  def tracer_factory
    @tracer_factory ||= Trace::TracerFactory.new
  end

  # @return [Object, Metrics::Meter] registered meter or a default no-op
  #   implementation of the meter
  def meter
    @meter ||= Metrics::Meter.new
  end

  # @return [Object, DistributedContext::Manager] registered distributed
  #   context manager or a default no-op implementation of the manager
  def distributed_context_manager
    @distributed_context_manager ||= DistributedContext::Manager.new
  end

  self.logger = Logger.new(STDOUT)
end
