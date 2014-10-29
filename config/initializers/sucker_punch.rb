# config/initializers/sucker_punch.rb

SuckerPunch.config do
  queue name: :sorteu_queue, worker: sortEu, workers: 5
end